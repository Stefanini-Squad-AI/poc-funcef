using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections;
using System.Configuration;
using System.Diagnostics;
using System.Data;
using System.Threading;
using System.Web.Security;
using System.Xml.Linq;
using Microsoft.Reporting.WebForms;
using System.IO;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System.Globalization;
using Aspose;
using Aspose.Words;

//William Moreira da Silva - SIG 27351
using FUNCEF.Planus.Componentes;

using Novacode;
using Aspose.Words.Saving;
//William Moreira da Silva - SIG 27351

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Quitacao
{
    public partial class ImpressaoContrato : PaginaSegura
    {

        #region Propriedades

        private string guidQuitacao
        {
            get
            {
                string queryString = Request.QueryString["guidQuitacao"];

                return queryString;
            }
        }
        private DocX WordDoc = null;

        #endregion

        #region eventos
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    RelatorioContrato relatorio = (RelatorioContrato)this.proxyEstado.obterEstado(this.guidQuitacao);

                    this.geraRelatorio(relatorio);
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
        #endregion

        #region metodos auxiliares
        private void geraRelatorio(RelatorioContrato relatorio)
        {
            LeioutContrato leiout = new LeioutContrato();
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                if (relatorio.CampanhaDesconto == false)
                {
                    leiout = cliente.contrato.consultarleiout(relatorio.tipoContrato.id, relatorio.DataInicioVigencia);
                }
                else
                {
                    leiout = cliente.contrato.ConsultarLeioutCampanhaDesconto(89);
                }
            }

            //Verifica e cria o diretorio temporario para os contratos
            if (!System.IO.File.Exists("C:\\WebPlanus\\Temp"))
            {
                Directory.CreateDirectory("C:\\WebPlanus\\Temp");
            }

            using (Stream str = new MemoryStream(leiout.leioutContrato))
            {
                WordDoc = DocX.Load(str);
                WordDoc = substituiTags(WordDoc, relatorio);
                WordDoc.SaveAs("C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + ".docx");
            }

            Byte[] contrato = null;

            if (File.Exists("C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + ".pdf"))
            {
                File.Delete("C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + ".pdf");
            }

            try
            {
                if (!this.geraPDF(relatorio))
                {
                    throw new ExcecaoPlanus("Erro ao gerar PDF.");
                }
     
            }
            catch (Exception e)
            {
                throw e;
            }

            contrato = this.preencheContrato(relatorio.mutuario.matricula.ToString());

            relatorio.impresso = 1;

            Session["imprimiu"] = "1";
            Session["relatorio"] = relatorio;

            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Type", "application/pdf");
            Response.AddHeader("Content-Disposition", "inline");
            Response.BinaryWrite(contrato);
            Response.Flush();
            Response.End();
        }

        /// <summary>
        /// Sutitui as tags dentro do leiout do contrato
        /// </summary>
        /// <param name="leiout">Leiouts do contrato carregado</param>
        /// <param name="relatorio">Objeto relatorio com as ~informações que serão substituidas</param>
        /// <returns>Retorna documento já com as tags substituidas</returns>
        private DocX substituiTags(DocX leiout, RelatorioContrato relatorio)
        {
            //Informações principais
            WordDoc.ReplaceText("<NOME>", relatorio.mutuario.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<MATRICULA>", relatorio.mutuario.matricula, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<CPF>", UtilidadeSistema.formatarCPF(relatorio.mutuario.cpf), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<NOMETESTEMUNHA1>", relatorio.nomeTest1, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<CPFTESTEMUNHA1>", relatorio.cpfTest1, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<NOMETESTEMUNHA2>", relatorio.nomeTest2, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<CPFTESTEMUNHA2>", relatorio.cpfTest2, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //WordDoc.ReplaceText("<RG>", relatorio.identidade, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //WordDoc.ReplaceText("<UF>", relatorio.uf.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<ENDERECO>", relatorio.logradouro + " ," + relatorio.numero + " ," + relatorio.complemento, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<BAIRRO>", relatorio.bairro, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //WordDoc.ReplaceText("<CIDADE>", relatorio.cidade.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<CEP>", relatorio.cep, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TELEFONECEL>", relatorio.numeroCelular, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TELEFONECOM>", relatorio.numeroComercial, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TELEFONERES>", relatorio.numeroResidencial, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<EMAILPESS>", relatorio.emailPessoal, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<EMAILCOMER>", relatorio.emailComercial, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);



            //Dados campanha desconto...
            WordDoc.ReplaceText("<MODALIDADE>", relatorio.tipoContrato.descricao, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<DATACREDITO>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

            //Percentual de Descontos
            WordDoc.ReplaceText("<DESC_PARCELA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<DESC_FGQC>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<DESC_CORRECAOM>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<DESC_JREMUNERA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<DESC_JMORA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<DESC_MULTA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<DESC_IOFCOMPLE>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            
            //Valor atual
            WordDoc.ReplaceText("<VLRATUALPARCELA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRATUALFGQC>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRATUALCORRECAOM>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRATUALJREMUNERA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRATUALJMORA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRATUALMULTA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRATUALIOF>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

            //Valor com desconto
            WordDoc.ReplaceText("<VLRDESCPARCELA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRDESCFGQC>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRDESCCORRECAOM>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRDESCJREMUNERA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRDESCJMORA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRDESCMULTA>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<VLRDESCIOF>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

            //Valores totais
            WordDoc.ReplaceText("<VLRSALDODEVVENCER>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<SALDODEVTOTAL>", relatorio.DataCredito.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

            




            if (relatorio.financiamento)
            {
                WordDoc.ReplaceText("<FINANCIAMENTO>", "X", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<VALORFINANCIAMENTO>", String.Format("{0:C}", relatorio.valorFinanciamento).Substring(3), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            }
            else
            {
                WordDoc.ReplaceText("<FINANCIAMENTO>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<VALORFINANCIAMENTO>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            }

            WordDoc.ReplaceText("<CONTRATOSQUITADOS>", relatorio.contratosQuitados, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

            //Informações bancaria
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                //relatorio.conta = cliente.contrato.consultarContaBancariaOperacao(relatorio.conta.id);
                relatorio.conta = cliente.contrato.consultarContaBancaria(0, relatorio.conta.id, 0)[0];

                //William Moreira da Silva - SIG 34259
                relatorio.conta.operacao = relatorio.conta.contaCorrente.Substring(0, 3);
                relatorio.conta.contaCorrente = relatorio.conta.contaCorrente.Substring(3);
                //William Moreira da Silva - SIG 34259
            }

            WordDoc.ReplaceText("<AGENCIA1>", relatorio.conta.agencia.ToString().Substring(0, 4), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<CONTABANCARIA1>", relatorio.conta.contaCorrente.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //William Moreira da Silva - SIG 34259
            WordDoc.ReplaceText("<OPERACAO1>", relatorio.conta.operacao.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //William Moreira da Silva - SIG 34259

            WordDoc.ReplaceText("<AGENCIA2>", relatorio.conta.agencia.ToString().Substring(0, 4), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<CONTABANCARIA2>", relatorio.conta.contaCorrente.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //William Moreira da Silva - SIG 34259
            WordDoc.ReplaceText("<OPERACAO2>", relatorio.conta.operacao.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //William Moreira da Silva - SIG 34259

            //Valores do contrato
            if (relatorio.valorMaximo == relatorio.valorSolicitado)
            {
                WordDoc.ReplaceText("<EVALORMAXIMO>", "X", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<NAOVALORMAXIMO>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<VALORSOLICITADO>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            }
            else
            {
                WordDoc.ReplaceText("<EVALORMAXIMO>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<NAOVALORMAXIMO>", "X", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<VALORSOLICITADO>", String.Format("{0:C}", relatorio.valorSolicitado).Substring(3), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            }
            WordDoc.ReplaceText("<PRAZO>", relatorio.prazo.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

            //Informações sobre os fiadores caso o participante for autoPatrocinado
            if (!relatorio.mutuario.flginternoParticipante.ToUpper().Equals("MA"))
            {
                WordDoc.ReplaceText("<APNOME>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<APMATRICULA>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<PROFISSAO>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<APCPF>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                this.substituiTagsFiadorBranco(1);
                this.substituiTagsFiadorBranco(2);
            }
            else
            {

                Pessoa pessoa = null;
                WordDoc.ReplaceText("<APNOME>", relatorio.mutuario.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<APMATRICULA>", relatorio.mutuario.matricula, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<PROFISSAO>", relatorio.profissao, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<APCPF>", UtilidadeSistema.formatarCPF(relatorio.mutuario.cpf), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                #region Informações sobre o segundo Fiador
                //Informações do primeiro FIADOR
                pessoa = this.buscaInfosFiadores(relatorio.fiadores[0].id);
                WordDoc.ReplaceText("<NOMEFIADOR1>", pessoa.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CPFFIADOR1>", UtilidadeSistema.formatarCPF(pessoa.numDocumento.ToString()), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                if (pessoa.documentos.Count > 0)
                {
                    WordDoc.ReplaceText("<RGFIADOR1>", pessoa.documentos[0].numDocumento.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
                else
                {
                    WordDoc.ReplaceText("<RGFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }

                string endereco;

                //Preenchendo o endereço do primeiro FIADOR
                if (pessoa.enderecos.Count != 0)
                {
                    endereco = pessoa.enderecos[0].logradouro + ", " + pessoa.enderecos[0].numero + ", " + pessoa.enderecos[0].complemento;
                    WordDoc.ReplaceText("<ENDERECOFIADOR1>", endereco, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<BAIRROFIADOR1>", pessoa.enderecos[0].bairro.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CIDADEFIADOR1>", pessoa.enderecos[0].cidade.nome.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<UFFIADOR1>", pessoa.enderecos[0].uf.nome.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CEPFIADOR1>", pessoa.enderecos[0].cep.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
                else
                {
                    WordDoc.ReplaceText("<ENDERECOFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<BAIRROFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CIDADEFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<UFFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CEPFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
                //-----------------------------------------

                //Informações os telefones do pimeiro FIADOR
                Telefone telefone = pessoa.telefones.Find(t1 => t1.telCelular != "");
                if (telefone != null)
                {
                    WordDoc.ReplaceText("<TELCELFIAD1>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
                else
                {
                    WordDoc.ReplaceText("<TELCELFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
                telefone = pessoa.telefones.Find(t1 => t1.telComercial != "");
                if (telefone != null)
                {
                    WordDoc.ReplaceText("<TELCOMFIAD1>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
                else
                {
                    WordDoc.ReplaceText("<TELCOMFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
                telefone = pessoa.telefones.Find(t1 => t1.telParticular != "");
                if (telefone != null)
                {
                    WordDoc.ReplaceText("<TELRESFIAD1>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
                else
                {
                    WordDoc.ReplaceText("<TELRESFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }

                //Informações os emails do pimeiro FIADOR
                WordDoc.ReplaceText("<EMAILPESSOAFIADOR1>", pessoa.email, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<EMAILCOMERCIALFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                #endregion

                #region informações conjugue primeiro Fiador
                //Informações do primeiro FIADOR
                if (relatorio.fiadores[0].idConjugue != 0)
                {
                    pessoa = this.buscaInfosFiadores(relatorio.fiadores[0].idConjugue);
                    WordDoc.ReplaceText("<CNOMEFIADOR1>", pessoa.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CCPFFIADOR1>", UtilidadeSistema.formatarCPF(pessoa.numDocumento.ToString()), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    if (pessoa.documentos.Count > 0)
                    {
                        WordDoc.ReplaceText("<CRGFIADOR1>", pessoa.documentos[0].numDocumento.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    //Preenchendo o endereço do primeiro FIADOR
                    if (pessoa.enderecos.Count != 0)
                    {
                        endereco = pessoa.enderecos[0].logradouro + ", " + pessoa.enderecos[0].numero + ", " + pessoa.enderecos[0].complemento;
                        WordDoc.ReplaceText("<CENDERECOFIADOR1>", endereco, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CBAIRROFIADOR1>", pessoa.enderecos[0].bairro.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CCIDADEFIADOR1>", pessoa.enderecos[0].cidade.nome.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CUFFIADOR1>", pessoa.enderecos[0].uf.nome.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CCEPFIADOR1>", pessoa.enderecos[0].cep.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    else
                    {
                        WordDoc.ReplaceText("<CENDERECOFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CBAIRROFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CCIDADEFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CUFFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CCEPFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    //-----------------------------------------

                    //Informações os telefones do pimeiro FIADOR
                    telefone = pessoa.telefones.Find(t1 => t1.telCelular != "");
                    if (telefone != null)
                    {
                        WordDoc.ReplaceText("<CTELCELFIAD1>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    else
                    {
                        WordDoc.ReplaceText("<CTELCELFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    telefone = pessoa.telefones.Find(t1 => t1.telComercial != "");
                    if (telefone != null)
                    {
                        WordDoc.ReplaceText("<CTELCOMFIAD1>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    else
                    {
                        WordDoc.ReplaceText("<CTELCOMFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    telefone = pessoa.telefones.Find(t1 => t1.telParticular != "");
                    if (telefone != null)
                    {
                        WordDoc.ReplaceText("<CTELRESFIAD1>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    else
                    {
                        WordDoc.ReplaceText("<CTELRESFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }

                    //Informações os emails do pimeiro FIADOR
                    WordDoc.ReplaceText("<CEMAILPESSOAFIADOR1>", pessoa.email, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CEMAILCOMERCIALFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
                else
                {
                    WordDoc.ReplaceText("<CNOMEFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CCPFFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CRGFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                    WordDoc.ReplaceText("<CENDERECOFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CBAIRROFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CCIDADEFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CUFFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CCEPFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                    WordDoc.ReplaceText("<CTELCELFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CTELCOMFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CTELRESFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                    //Informações os emails do pimeiro FIADOR
                    WordDoc.ReplaceText("<CEMAILPESSOAFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CEMAILCOMERCIALFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                }
                #endregion

                #region Informações sobre o segundo Fiador
                if (relatorio.fiadores[1].id != 0)
                {
                    //Informações do segundo FIADOR
                    pessoa = this.buscaInfosFiadores(relatorio.fiadores[0].id);
                    WordDoc.ReplaceText("<NOMEFIADOR2>", pessoa.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<CPFFIADOR2>", UtilidadeSistema.formatarCPF(pessoa.numDocumento.ToString()), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    if (pessoa.documentos.Count > 0)
                    {
                        WordDoc.ReplaceText("<RGFIADOR2>", pessoa.documentos[0].numDocumento.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    else
                    {
                        WordDoc.ReplaceText("<RGFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    //Preenchendo o endereço do segundo FIADOR
                    //Preenchendo o endereço do primeiro FIADOR
                    if (pessoa.enderecos.Count != 0)
                    {
                        endereco = pessoa.enderecos[0].logradouro + ", " + pessoa.enderecos[0].numero + ", " + pessoa.enderecos[0].complemento;
                        WordDoc.ReplaceText("<ENDERECOFIADOR2>", endereco, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<BAIRROFIADOR2>", pessoa.enderecos[0].bairro.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CIDADEFIADOR2>", pessoa.enderecos[0].cidade.nome.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<UFFIADOR2>", pessoa.enderecos[0].uf.nome.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CEPFIADOR2>", pessoa.enderecos[0].cep.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    else
                    {
                        WordDoc.ReplaceText("<ENDERECOFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<BAIRROFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CIDADEFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<UFFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CEPFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    //-----------------------------------------

                    //Informações os telefones do segundo FIADOR
                    telefone = pessoa.telefones.Find(t1 => t1.telCelular != "");
                    if (telefone != null)
                    {
                        WordDoc.ReplaceText("<TELCELFIAD2>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    else
                    {
                        WordDoc.ReplaceText("<TELCELFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    telefone = pessoa.telefones.Find(t1 => t1.telComercial != "");
                    if (telefone != null)
                    {
                        WordDoc.ReplaceText("<TELCOMFIAD2>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    else
                    {
                        WordDoc.ReplaceText("<TELCOMFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    telefone = pessoa.telefones.Find(t1 => t1.telParticular != "");
                    if (telefone != null)
                    {
                        WordDoc.ReplaceText("<TELRESFIAD2>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    else
                    {
                        WordDoc.ReplaceText("<TELRESFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }

                    //Informações os emails do segundo FIADOR
                    WordDoc.ReplaceText("<EMAILPESSOAFIADOR2>", pessoa.email, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<EMAILCOMERCIALFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                #endregion

                #region informações conjugue segundo Fiador
                    //Informações do primeiro FIADOR
                    if (relatorio.fiadores[1].idConjugue != 0)
                    {
                        pessoa = this.buscaInfosFiadores(relatorio.fiadores[0].idConjugue);
                        WordDoc.ReplaceText("<CNOMEFIADOR2>", pessoa.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CCPFFIADOR2>", UtilidadeSistema.formatarCPF(pessoa.numDocumento.ToString()), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        if (pessoa.documentos.Count > 0)
                        {
                            WordDoc.ReplaceText("<CRGFIADOR2>", pessoa.documentos[0].numDocumento.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        }
                        else
                        {
                            WordDoc.ReplaceText("<CRGFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        }

                        if (pessoa.enderecos.Count != 0)
                        {
                            endereco = pessoa.enderecos[0].logradouro + ", " + pessoa.enderecos[0].numero + ", " + pessoa.enderecos[0].complemento;
                            WordDoc.ReplaceText("<CENDERECOFIADOR2>", endereco, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                            WordDoc.ReplaceText("<CBAIRROFIADOR2>", pessoa.enderecos[0].bairro.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                            WordDoc.ReplaceText("<CCIDADEFIADOR2>", pessoa.enderecos[0].cidade.nome.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                            WordDoc.ReplaceText("<CUFFIADOR2>", pessoa.enderecos[0].uf.nome.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                            WordDoc.ReplaceText("<CCEPFIADOR2>", pessoa.enderecos[0].cep.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        }
                        else
                        {
                            WordDoc.ReplaceText("<CENDERECOFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                            WordDoc.ReplaceText("<CBAIRROFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                            WordDoc.ReplaceText("<CCIDADEFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                            WordDoc.ReplaceText("<CUFFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                            WordDoc.ReplaceText("<CCEPFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        }
                        //-----------------------------------------

                        telefone = pessoa.telefones.Find(t1 => t1.telCelular != "");
                        if (telefone != null)
                        {
                            WordDoc.ReplaceText("<CTELCELFIAD2>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        }
                        else
                        {
                            WordDoc.ReplaceText("<CTELCELFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        }
                        telefone = pessoa.telefones.Find(t1 => t1.telComercial != "");
                        if (telefone != null)
                        {
                            WordDoc.ReplaceText("<CTELCOMFIAD2>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        }
                        else
                        {
                            WordDoc.ReplaceText("<CTELCOMFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        }
                        telefone = pessoa.telefones.Find(t1 => t1.telParticular != "");
                        if (telefone != null)
                        {
                            WordDoc.ReplaceText("<CTELRESFIAD2>", telefone.numero, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        }
                        else
                        {
                            WordDoc.ReplaceText("<CTELRESFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        }

                        WordDoc.ReplaceText("<CEMAILPESSOAFIADOR2>", pessoa.email, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CEMAILCOMERCIALFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    }
                    else
                    {
                        WordDoc.ReplaceText("<CNOMEFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CCPFFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CRGFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                        WordDoc.ReplaceText("<CENDERECOFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CBAIRROFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CCIDADEFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CUFFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CCEPFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                        WordDoc.ReplaceText("<CTELCELFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CTELCOMFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CTELRESFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                        WordDoc.ReplaceText("<CEMAILPESSOAFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                        WordDoc.ReplaceText("<CEMAILCOMERCIALFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                    }
                    #endregion
                }
                else
                {
                    this.substituiTagsFiadorBranco(2);
                }
            }
      
            String mes = new CultureInfo("pt-BR").DateTimeFormat.GetMonthName(DateTime.Today.Month).ToString();

            WordDoc.ReplaceText("<ADIA>", DateTime.Today.Day.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<AMES>", mes, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<AANO>", DateTime.Today.Year.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
           

            return leiout;
        }

        /// <summary>
        /// Busca as informações do fiadores, caso o participante for autopatrocinado
        /// </summary>
        /// <param name="idFiador">IDFIADOR - identificação da pessoa(IdPessoa)</param>
        /// <returns>Retorna o fiador</returns>
        public Pessoa buscaInfosFiadores(int idFiador)
        {
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                Pessoa pessoa = null;

                pessoa = cliente.contrato.consultarInfPessoa(idFiador);
                pessoa.documentos = new List<Documento>();
                pessoa.documentos = cliente.contrato.consultarDocPessoa(idFiador);
                pessoa.documentos.RemoveAll(t1 => t1.nome != "RG");

                pessoa.enderecos = new List<Endereco>();
                pessoa.enderecos = cliente.contrato.consultarEndPessoa(idFiador);
                pessoa.enderecos.RemoveAll(t1 => t1.endResidencial == false);

                pessoa.telefones = new List<Telefone>();
                pessoa.telefones = cliente.contrato.consultarTelPessoa(idFiador);

                return pessoa;
            }
        }

        /// <summary>
        /// Quando o contrato~não tiver fiador, metodo deixa todas as tags referente ao fiador em branco
        /// </summary>
        /// <param name="fiador">Identificação do fiador do cotnrato se é o primeiro ou o segundo</param>
        public void substituiTagsFiadorBranco(int fiador)
        {
            if (fiador == 1)
            {
                WordDoc.ReplaceText("<NOMEFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CPFFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<RGFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<ENDERECOFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<BAIRROFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CIDADEFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<UFFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CEPFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<TELCELFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<TELCOMFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<TELRESFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<EMAILPESSOAFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<EMAILCOMERCIALFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                WordDoc.ReplaceText("<CNOMEFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CCPFFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CRGFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CENDERECOFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CBAIRROFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CCIDADEFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CUFFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CCEPFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CTELCELFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CTELCOMFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CTELRESFIAD1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CEMAILPESSOAFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CEMAILCOMERCIALFIADOR1>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            }

            if (fiador == 2)
            {
                WordDoc.ReplaceText("<NOMEFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CPFFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<RGFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<ENDERECOFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<BAIRROFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CIDADEFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<UFFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CEPFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<TELCELFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<TELCOMFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<TELRESFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<EMAILPESSOAFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<EMAILCOMERCIALFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                WordDoc.ReplaceText("<CNOMEFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CCPFFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CRGFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CENDERECOFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CBAIRROFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CCIDADEFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CUFFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CCEPFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CTELCELFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CTELCOMFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CTELRESFIAD2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CEMAILPESSOAFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CEMAILCOMERCIALFIADOR2>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            }
        }

        /// <summary>
        /// Lê o contrato em pdf gerado ao final do processo.
        /// </summary>
        /// <param name="matricula"></param>
        /// <returns>Contrato já convertido para PDF gerado pelo processo.</returns>
        Byte[] preencheContrato(string matricula)
        {
            return File.ReadAllBytes("C:\\WebPlanus\\Temp\\Contrato" + matricula + ".pdf");
        }

        /// <summary>
        /// Metodo que chama o programa para converter o DOCX para PDF
        /// </summary>
        /// <param name="relatorio">Objeto com as informações do relatorio a ser gerado.</param>
        //William Moreira da Silva - SOL 257106 - PPM 956387
        private bool geraPDF(RelatorioContrato relatorio)
        {            
            return this.ConvertDocToPDF("C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + @".docx", 8.5, 11, "C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + @".pdf");
        }


        private bool ConvertDocToPDF(string DocFile, double pageWidth, double pageHeight, string PDFFile)
        {
            Aspose.Words.Document document = new Aspose.Words.Document(DocFile);
            if (document != null)
            {
                if (pageWidth > 0.0 && pageHeight > 0.0)
                {
                    foreach (Aspose.Words.Section section in document)
                    {
                        section.PageSetup.PageWidth = pageWidth * 72.0;
                        section.PageSetup.PageHeight = pageHeight * 72.0;
                    }
                }
                document.Save(PDFFile, new Aspose.Words.Saving.PdfSaveOptions
                {
                    OutlineOptions =
                    {
                        DefaultBookmarksOutlineLevel = 9,
                        ExpandedOutlineLevels = 9,
                        HeadingsOutlineLevels = 9
                    },
                    FontEmbeddingMode = PdfFontEmbeddingMode.EmbedNonstandard
                });

                return File.Exists(PDFFile);
            }
            return false;
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
                return IdentificacaoContexto.emprestimo;
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