#region SIG 50871
/// Autor:  
/// William Santana
///
/// Data da Atualização:
/// 03/08/2017
///
/// incluir novas tags/indicadores aos modelos de contrato de empréstimo.
///
#endregion

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
using Aspose.Words.Saving;
//William Moreira da Silva - SIG 27351
using FUNCEF.Planus.Componentes;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using Novacode;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Configuration;
using System.Text;
using Newtonsoft.Json;
using System.Net.Http;
using Newtonsoft.Json.Linq;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.Componentes;
using Aspose.Words.Saving;
using System.Drawing;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;
using System.Net;
//William Moreira da Silva - SIG 27351

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo
{
    public partial class ImpressaoContrato : PaginaSegura
    {

        #region Propriedades

        private string guidImpressao
        {
            get
            {
                string queryString = Request.QueryString["guidImpressao"];

                return queryString;
            }
        }
        private DocX WordDoc = null;

        private long NumeroContrato
        {
            get
            {
                string queryString = Request.QueryString["NumeroContrato"];
                long NumeroContrato = 0;

                long.TryParse(queryString, out NumeroContrato);

                return NumeroContrato;
            }
        }

        #endregion

        #region eventos
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    long NumeroContrato = (long)this.proxyEstado.obterEstado(this.guidImpressao);

                    RelatorioContrato relatorio = PrepararDadosContrato(NumeroContrato);

                    //RelatorioContrato relatorio = (RelatorioContrato)this.proxyEstado.obterEstado(this.guidImpressao);

                    //63057
                    //Campanha Desconto
                    //SIG 67808
                    //if (relatorio.CampanhaDesconto == false)
                    //{
                    //    this.geraRelatorio(relatorio);
                    //}
                    //else
                    //{

                    if (relatorio.ContratoAntigoSemMinuta == false) // chamada vem da interface de simulação de contrato
                    { 
                        ContratoDTO objContrato = ToContratoDTO(relatorio);
                        BuscaDadosApiContratos(relatorio.numeroContrato, 0, objContrato);
                    }
                    else
                    {
                        //RelatorioContrato DadosAutoatendimento = new RelatorioContrato();
                        //using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                        //{
                        //    DadosAutoatendimento = cliente.contrato.BuscarDadosContratosAutoAtendimento(relatorio.numeroContrato);
                        //    DadosAutoatendimento.mutuario = relatorio.mutuario;
                        //    using (Cliente<IServicoConcessao> client = new Cliente<IServicoConcessao>())
                        //    {
                        //        relatorio.tipoContrato = client.contrato.ConsultarTipoContrato(DadosAutoatendimento.tipoContrato.id);
                        //    }
                        //}
                        
                        relatorio.SeloCarimboTempo = ObterSeloComprovante(relatorio);// SIG 129005
                        //relatorio.ImagemSeloCarimbo = Base64ToImage(relatorio.SeloCarimboTempo);
                        this.geraRelatorio(relatorio); // SIG 129005 - chamada vem da interface de consulta de contratos e parcelas
                    }

                    //}

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
                //Campanha Desconto
                if (relatorio.CampanhaDesconto == false)
                {
                    leiout = cliente.contrato.consultarleiout(relatorio.tipoContrato.id, relatorio.dataAssinatura);

                    if (leiout.leioutContrato == null)
                    {
                        registrarAlerta("Não foi encontrada minuta para o contrato " + relatorio.numeroContrato.ToString() + ". Verifique a modalidade e data de assinatura.");
                        return;
                    }
                }
                else
                {
                    leiout = cliente.contrato.ConsultarLeioutCampanhaDesconto(relatorio.tipoContrato.id);
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

                byte[] imageBytes = Convert.FromBase64String(relatorio.SeloCarimboTempo);

                //using (MemoryStream ms = new MemoryStream())
                using (var ms = new MemoryStream(imageBytes, 0, imageBytes.Length))
                {
                    //System.Drawing.Image myImg = Base64ToImage(relatorio.SeloCarimboTempo);
                    System.Drawing.Image myImg = System.Drawing.Image.FromStream(ms, true);

                    myImg.Save(ms, myImg.RawFormat);  // Save your picture in a memory stream.
                    ms.Seek(0, SeekOrigin.Begin);

                    Novacode.Image img = WordDoc.AddImage(ms); // Create image.

                    //Novacode.Paragraph p = WordDoc.InsertParagraph("Hello", false);

                    Picture pic1 = img.CreatePicture(150,250);     // Create picture.
                    pic1.SetPictureShape(BasicShapes.cube); // Set picture shape (if needed)

                    //p.InsertPicture(pic1, 0); // Insert picture into paragraph.
                    
            
                    var paragraphs = WordDoc.Paragraphs.Where(x => x.Text.Contains("[selo]"));
                    foreach (var paragraph in paragraphs)
                    {
                        
                        //paragraph.AppendPicture(docxImage.CreatePicture(50, 150));
                        paragraph.InsertPicture(pic1, 0);
                        paragraph.ReplaceText("[selo]", "");

                    }

                    //var paragraphs2 = WordDoc.Paragraphs.Where(x => x.Text.Contains("carimbo"));
                    //foreach (var paragraph in paragraphs2)
                    //{
                    //    paragraph.ReplaceText("<SELOCARIMBOTEMPO>", "");
                    //    //paragraph.AppendPicture(docxImage.CreatePicture(50, 150));
                    //    paragraph.InsertPicture(pic1, 0);

                    //}


                    //doc.Save();
                }


                WordDoc.SaveAs("C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + ".docx");
            }

            //William Moreira da Silva - SOL 257106 - PPM 956387
            //ProcessStartInfo processStartInfo = new ProcessStartInfo("cmd.exe");
            //processStartInfo.RedirectStandardInput = true;
            //processStartInfo.RedirectStandardOutput = true;
            //processStartInfo.UseShellExecute = false;
            //Process process = Process.Start(processStartInfo);
            //William Moreira da Silva - SOL 257106 - PPM 956387

            Byte[] contrato = null;

            if (File.Exists("C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + ".pdf"))
            {
                File.Delete("C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + ".pdf");
            }

            try
            {
                //William Moreira da Silva - SOL 257106 - PPM 956387
                //if (!File.Exists("C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + ".pdf"))
                //{
                //    process.StandardInput.WriteLine(@"""C:\PDFConvert\pdfconvert.exe"" /cs 3000 /i C:\WebPlanus\Temp\Contrato" + relatorio.mutuario.matricula.ToString() + @".docx /o C:\WebPlanus\Temp\Contrato" + relatorio.mutuario.matricula.ToString() + @".pdf /ph 11 /pw 8,5");
                //}
                //William Moreira da Silva - SIG 27351
                if (!this.geraPDF(relatorio))
                {
                    throw new ExcecaoPlanus("Erro ao gerar PDF.");
                }
                //William Moreira da Silva - SIG 27351
                //William Moreira da Silva - SOL 257106 - PPM 956387
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
            WordDoc.ReplaceText("<RG>", relatorio.identidade, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<UF>", relatorio.uf.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

            string EnderecoNumero = relatorio.numero.Trim() == "-"  ? "" : relatorio.numero;
            string EnderecoComplemento = relatorio.complemento.Trim() == "-" ? "" : relatorio.complemento;

            WordDoc.ReplaceText("<ENDERECO>", relatorio.logradouro + " " + EnderecoNumero + " " + EnderecoComplemento, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            
            WordDoc.ReplaceText("<BAIRRO>", relatorio.bairro, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<CIDADE>", relatorio.cidade.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<CEP>", relatorio.cep, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TELEFONECEL>", relatorio.numeroCelular, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TELEFONECOM>", relatorio.numeroComercial, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TELEFONERES>", relatorio.numeroResidencial, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<EMAILPESS>", relatorio.emailPessoal, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<EMAILCOMER>", relatorio.emailComercial, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

            WordDoc.ReplaceText("<HASHCARIMBO>", relatorio.Carimbo.Codigo_Hash, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

            var bytes = Convert.FromBase64String(relatorio.SeloCarimboTempo);
            Stream contents =new MemoryStream(bytes);
            WordDoc.AddImage(contents);



            

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
            //if (relatorio.valorMaximo == relatorio.valorSolicitado)
            //{
            //    WordDoc.ReplaceText("<EVALORMAXIMO>", "X", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //    WordDoc.ReplaceText("<NAOVALORMAXIMO>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //    WordDoc.ReplaceText("<VALORSOLICITADO>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //}
            //else
            //{
                WordDoc.ReplaceText("<EVALORMAXIMO>", "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<NAOVALORMAXIMO>", "X", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<VALORSOLICITADO>", String.Format("{0:N}", relatorio.valorSolicitado), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //}
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

                Pessoa pessoa = new Pessoa();
                
                WordDoc.ReplaceText("<APNOME>", relatorio.mutuario.nome, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<APMATRICULA>", relatorio.mutuario.matricula, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<PROFISSAO>", relatorio.profissao, false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<APCPF>", UtilidadeSistema.formatarCPF(relatorio.mutuario.cpf), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

                #region Informações sobre o segundo Fiador

                //Informações do primeiro FIADOR
                // SIG 131152 - Corrigir erro ao verificar dados do fiador
                if (relatorio.fiadores[0].id != 0) 
                { 
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
                }
                string endereco;
                // SIG 131152 - Corrigir erro ao verificar dados do fiador
                pessoa.enderecos = new List<Endereco>();
                // SIG 131152 - Corrigir erro ao verificar dados do fiador

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

                // SIG 131152 - Corrigir erro ao verificar dados do fiador
                pessoa.telefones = new List<Telefone>();
                // SIG 131152 - Corrigir erro ao verificar dados do fiador

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
            //William Moreira da Silva - SOL 257106 - PPM 956387
            String mes = new CultureInfo("pt-BR").DateTimeFormat.GetMonthName(DateTime.Today.Month).ToString();

            WordDoc.ReplaceText("<DIA>", relatorio.dataAssinatura.Day.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<MES>", relatorio.dataAssinatura.ToString("MMMM", System.Globalization.CultureInfo.CreateSpecificCulture("pt-BR")), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<ANO>", string.Format("{0:yyyy}", relatorio.dataAssinatura), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            //William Moreira da Silva - SOL 257106 - PPM 956387

            //William Santana - SIG 50871 - início

            #region Taxas
            //FGQC
            WordDoc.ReplaceText("<TX_FGQC_34>", String.Format("{0:N4}", relatorio.txfgqc34) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TX_FGQC_35A49>", String.Format("{0:N4}", relatorio.txfgqc35a49) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TX_FGQC_50A59>", String.Format("{0:N4}", relatorio.txfgqc50a59) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TX_FGQC_60A74>", String.Format("{0:N4}", relatorio.txfgqc60a74) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TX_FGQC_75A84>", String.Format("{0:N4}", relatorio.txfgqc75a84) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            WordDoc.ReplaceText("<TX_FGQC_85>", String.Format("{0:N4}", relatorio.txfgqc85) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);

            //Taxa de Juros            
            if (relatorio.txjuros13sal == 0)
            {
                if (relatorio.txjuros24 == 0)
                {
                    WordDoc.ReplaceText("<TX_JUROS_12>", String.Format("{0:N4}", relatorio.txjuros12) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<TX_JUROS_13A24>", String.Format("{0:N4}", relatorio.txjuros13a24) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<TX_JUROS_25A36>", String.Format("{0:N4}", relatorio.txjuros25a36) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<TX_JUROS_37A48>", String.Format("{0:N4}", relatorio.txjuros37a48) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
                else
                {
                    WordDoc.ReplaceText("<TX_JUROS_24>", String.Format("{0:N4}", relatorio.txjuros24) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<TX_JUROS_25A48>", String.Format("{0:N4}", relatorio.txjuros25a48) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<TX_JUROS_49A72>", String.Format("{0:N4}", relatorio.txjuros49a72) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<TX_JUROS_73A96>", String.Format("{0:N4}", relatorio.txjuros73a96) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                    WordDoc.ReplaceText("<TX_JUROS_97A120>", String.Format("{0:N4}", relatorio.txjuros97a120) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }
            }
            else
            {
                WordDoc.ReplaceText("<TX_JUROS_13SAL>", String.Format("{0:N2}", relatorio.txjuros13sal) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            }

            //Taxa administrativa
            WordDoc.ReplaceText("<TX_ADM>", String.Format("{0:N2}", relatorio.txadm) + "%", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            #endregion

            if (relatorio.dtiniciovegencia != null)
            {
                WordDoc.ReplaceText("<DT_INICIO_VIGENCIA>", relatorio.dtiniciovegencia.ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
            }
            //William Santana - SIG 50871 - fim

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
                pessoa.documentos.RemoveAll(t1 => !t1.nome.Equals("RG") && !t1.nome.Equals("Carteira de Identidade"));

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
            //William Moreira da Silva - SIG 27351
            //while (true)
            //{
            //    try
            //    {
            return File.ReadAllBytes("C:\\WebPlanus\\Temp\\Contrato" + matricula + ".pdf");
            //    }
            //    catch (Exception)
            //    {
            //        Thread.Sleep(1000);
            //    }
            //}
            //William Moreira da Silva - SIG 27351
        }

        /// <summary>
        /// Metodo que chama o programa para converter o DOCX para PDF
        /// </summary>
        /// <param name="relatorio">Objeto com as informações do relatorio a ser gerado.</param>
        //William Moreira da Silva - SOL 257106 - PPM 956387
        private bool geraPDF(RelatorioContrato relatorio)
        {
            //William Moreira da Silva - SIG 27351
            //ProcessStartInfo processStartInfo = new ProcessStartInfo("cmd.exe");
            //processStartInfo.RedirectStandardInput = true;
            //processStartInfo.RedirectStandardOutput = true;
            //processStartInfo.UseShellExecute = false;
            //Process process = Process.Start(processStartInfo);

            //process.StandardInput.WriteLine(@"""C:\PDFConvert\pdfconvert.exe"" /cs 3000 /i C:\WebPlanus\Temp\Contrato" + relatorio.mutuario.matricula.ToString() + @".docx /o C:\WebPlanus\Temp\Contrato" + relatorio.mutuario.matricula.ToString() + @".pdf /ph 11 /pw 8,5");
            return this.ConvertDocToPDF("C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + @".docx", 8.5, 11, "C:\\WebPlanus\\Temp\\Contrato" + relatorio.mutuario.matricula.ToString() + @".pdf");
            //William Moreira da Silva - SIG 27351
        }
        //William Moreira da Silva - SOL 257106 - PPM 956387

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

        //Campanha Desconto
        private void BuscaDadosApiContratos(long NumContrato, int IdCalculo, ContratoDTO contratoDTO = null)       
        {
            try
            {
                string strContrato = contratoDTO == null ? "" : JsonConvert.SerializeObject(contratoDTO, Newtonsoft.Json.Formatting.Indented);
                string UriApigeradoraContrato = ConfigurationSettings.AppSettings["UriApigeradoraContrato"];

                IDictionary<string, object> parametros = new Dictionary<string, object>();
                parametros.Add("contrato", NumContrato);
                parametros.Add("calculo", IdCalculo);
                parametros.Add("internet", "0");
                parametros.Add("objContrato", strContrato);

                string json = JsonConvert.SerializeObject(parametros, Newtonsoft.Json.Formatting.Indented);

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
                        ContratoDTO contrato = new ContratoDTO(retornoJson.ToString());

                        //SIG 63057
                        if (!string.IsNullOrEmpty(contrato.ContratoHTML))
                            Session["ContratoHTML"] = contrato.ContratoHTML;

                        if (contrato == null || string.IsNullOrEmpty(contrato.ContratoHTML))
                        {
                            throw new Exception("Erro ao gerar documento de contrato.");
                        }

                        //SIG 63057
                        if (contrato.ContratoImpressao != null)
                        {
                            Response.ContentType = "application/pdf";
                            Response.AddHeader("content-length", contrato.ContratoImpressao.Length.ToString());
                            Response.BinaryWrite(contrato.ContratoImpressao);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        //private string GerarContratoEmprestimo(long NumeroContrato, int IdTipoContrato)
        //{
        //    string contrato = string.Empty;
        //    try
        //    {
        //        string UriApigeradoraContrato = ConfigurationManager.AppSettings["UriApiGeradoraContratos"];
        //        IDictionary<string, object> parametros = new Dictionary<string, object>();
        //        parametros.Add("NumeroContrato", NumeroContrato);
        //        parametros.Add("IdTipoContrato", IdTipoContrato);

        //        string json = JsonConvert.SerializeObject(parametros, Newtonsoft.Json.Formatting.Indented);

        //        using (StringContent content = new StringContent(json, Encoding.UTF8, "application/json"))
        //        {
        //            HttpClient cliente = new HttpClient();
        //            cliente.BaseAddress = new Uri(UriApigeradoraContrato);
        //            var response = cliente.PostAsync(UriApigeradoraContrato, content).Result;

        //            if (response.IsSuccessStatusCode)
        //            {
        //                var strJson = response.Content.ReadAsStringAsync().Result;
        //                JObject retornoJson = JsonConvert.DeserializeObject<JObject>(strJson);

        //                if (!string.IsNullOrEmpty(retornoJson.ToString()))
        //                {
        //                    JObject jObject = JObject.Parse(retornoJson.ToString());
        //                    JToken jcontrato = jObject["resultado"];
        //                    contrato = jcontrato.ToString();
        //                }
        //            }
        //        }
        //        return contrato;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        private ContratoDTO ToContratoDTO(RelatorioContrato relatorioContrato)
        {
            ContratoDTO contrato = new ContratoDTO(string.Empty);
            
            contrato.NumeroContrato = relatorioContrato.numeroContrato;
            contrato.NumParcelas = relatorioContrato.prazo;

            contrato.FlgPossuiCarimbo = 0;
            contrato.FlgEfetivado = 0;
            contrato.FlgLiquidoZero = 1;
            contrato.ValorLiquido = 0;
            contrato.ValorMaximo = relatorioContrato.valorMaximo;
            contrato.ValorSolicitado = relatorioContrato.valorSolicitado;
            contrato.DataCredito = (relatorioContrato.DataCredito.HasValue ? relatorioContrato.DataCredito : DateTime.Now.Date);
            contrato.DataAssinatura = (relatorioContrato.dataAssinatura != null ? relatorioContrato.dataAssinatura : DateTime.Now.Date);            
            contrato.Valido = true;
            contrato.MsgErro = string.Empty;
            contrato.DadosBancarios = string.Empty;
            contrato.Modalidade = relatorioContrato.tipoContrato.descricao;
            contrato.Prazo = relatorioContrato.tipoContrato.maximoParcelas;

            contrato.ContrAntQuit = relatorioContrato.contratosQuitados;
            contrato.FlgObrigatorio = "1";
            contrato.SeloCarimboTempo = string.Empty;
            contrato.Ip = "0";

            contrato.Matricula = relatorioContrato.mutuario.matricula;
            contrato.Nome = relatorioContrato.mutuario.nome;
            contrato.Cpf = relatorioContrato.mutuario.cpf;
            contrato.Rg = relatorioContrato.identidade;

            contrato.Logradouro = relatorioContrato.logradouro;
            contrato.Bairro = relatorioContrato.bairro;
            contrato.Cidade = relatorioContrato.cidade.nome;
            contrato.Uf = relatorioContrato.uf.nome;
            contrato.Cep = relatorioContrato.cep;

            contrato.TelCelular = relatorioContrato.numeroCelular;
            contrato.TelComercial = relatorioContrato.numeroComercial;
            contrato.TelResidencial = relatorioContrato.numeroResidencial;

            contrato.Agencia = relatorioContrato.conta.agencia.ToString().Substring(0, 4);
            contrato.Operacao = (string.IsNullOrEmpty(relatorioContrato.conta.operacao) ? relatorioContrato.conta.contaCorrente.Substring(0, 3) : relatorioContrato.conta.operacao);
            contrato.Conta = relatorioContrato.conta.contaCorrente.ToString();

            contrato.Emails = relatorioContrato.emailComercial + " " + relatorioContrato.emailPessoal;
            contrato.ValorMaxPermitido = (double)relatorioContrato.valorMaximo;
            contrato.Codigo_Hash = "";
            contrato.HashAssinatura = "";
            contrato.DataHoraCarimboTempo = DateTime.Now.ToString();
            contrato.IdTipoContrato = relatorioContrato.tipoContrato.id;
            contrato.ContratoQuitaAnterior = relatorioContrato.contratosQuitados;
            contrato.IdPessoa = relatorioContrato.mutuario.id;
            contrato.IdTitular = relatorioContrato.mutuario.idTitular;
            contrato.ConcessaoInternet = 0;

            contrato.descontoInadimplencia = relatorioContrato.descontoInadimplencia;            

            List<Pessoa> listaFiadores = new List<Pessoa>();
            foreach (var item in relatorioContrato.fiadores)
            {
                if (item.id > 0)
                {
                    Pessoa pessoa = this.buscaInfosFiadores(item.id);
                    pessoa.conjuge = "nao";
                    listaFiadores.Add(pessoa);
                }
                else if (item.idConjugue > 0)
                {
                    Pessoa conjuge = this.buscaInfosFiadores(item.idConjugue);
                    conjuge.conjuge = "sim";
                    listaFiadores.Add(conjuge);
                }
            }

            contrato.fiadores = listaFiadores.Count > 0 ? listaFiadores : new List<Pessoa>();
            contrato.financiamento = relatorioContrato.financiamento;
            contrato.valorFinanciamento = relatorioContrato.valorFinanciamento;
            contrato.PropostaCampanha = relatorioContrato.PropostaCampanha;
            contrato.SaldoDevedor = relatorioContrato.SaldoDevedor;
            contrato.SaldoInadimplente = relatorioContrato.SaldoInadimplente;
            contrato.profissao = relatorioContrato.profissao;
            contrato.tipoCobranca = relatorioContrato.tipoCobranca;
            //SIG 63057
            contrato.NomeTestemunha1 = relatorioContrato.nomeTest1;
            contrato.CpfTestemunha1 = relatorioContrato.cpfTest1;
            contrato.NomeTestemunha2 = relatorioContrato.nomeTest2;
            contrato.CpfTestemunha2 = relatorioContrato.cpfTest2;
            contrato.PossuiDesconto = relatorioContrato.CampanhaDesconto;
            contrato.DataSaldo = relatorioContrato.DataVencimento == null ? contrato.DataCredito : relatorioContrato.DataVencimento;
            
            return contrato;
        }



        #endregion

        public static string ObterSeloComprovante(RelatorioContrato DadosContrato)
        {
            Bitmap imgBitmap;
            System.Drawing.Image image;
            var tipoImagem = "jpeg";
            string imgBaseJpg = @"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AAAAAENsYnJib29sAAAAAABSZ3NNYm9vbAAAAAAAQ3JuQ2Jvb2wAAAAAAENudENib29sAAAAAABMYmxzYm9vbAAAAAAATmd0dmJvb2wAAAAAAEVtbERib29sAAAAAABJbnRyYm9vbAAAAAAAQmNrZ09iamMAAAABAAAAAAAAUkdCQwAAAAMAAAAAUmQgIGRvdWJAb+AAAAAAAAAAAABHcm4gZG91YkBv4AAAAAAAAAAAAEJsICBkb3ViQG/gAAAAAAAAAAAAQnJkVFVudEYjUmx0AAAAAAAAAAAAAAAAQmxkIFVudEYjUmx0AAAAAAAAAAAAAAAAUnNsdFVudEYjUHhsQFIAAAAAAAAAAAAKdmVjdG9yRGF0YWJvb2wBAAAAAFBnUHNlbnVtAAAAAFBnUHMAAAAAUGdQQwAAAABMZWZ0VW50RiNSbHQAAAAAAAAAAAAAAABUb3AgVW50RiNSbHQAAAAAAAAAAAAAAABTY2wgVW50RiNQcmNAWQAAAAAAAAAAABBjcm9wV2hlblByaW50aW5nYm9vbAAAAAAOY3JvcFJlY3RCb3R0b21sb25nAAAAAAAAAAxjcm9wUmVjdExlZnRsb25nAAAAAAAAAA1jcm9wUmVjdFJpZ2h0bG9uZwAAAAAAAAALY3JvcFJlY3RUb3Bsb25nAAAAAAA4QklNA+0AAAAAABAASAAAAAEAAgBIAAAAAQACOEJJTQQmAAAAAAAOAAAAAAAAAAAAAD+AAAA4QklNBA0AAAAAAAQAAAAeOEJJTQQZAAAAAAAEAAAAHjhCSU0D8wAAAAAACQAAAAAAAAAAAQA4QklNJxAAAAAAAAoAAQAAAAAAAAACOEJJTQP1AAAAAABIAC9mZgABAGxmZgAGAAAAAAABAC9mZgABAKGZmgAGAAAAAAABADIAAAABAFoAAAAGAAAAAAABADUAAAABAC0AAAAGAAAAAAABOEJJTQP4AAAAAABwAAD/////////////////////////////A+gAAAAA/////////////////////////////wPoAAAAAP////////////////////////////8D6AAAAAD/////////////////////////////A+gAADhCSU0EAAAAAAAAAgABOEJJTQQCAAAAAAAEAAAAADhCSU0EMAAAAAAAAgEBOEJJTQQtAAAA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bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDphZmVlMTUxYi00MWJlLWRmNDgtOTM1Ny1iZTU3OWNiY2E4NTMiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MGJmZmM5MmItOWU1NC1kYzQxLTk1OGItMzkyYjlkN2Y0OWJhIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9IjNCODZGMTBCMjUxOUJCQTlBQkM2QzVFN0M1QUU5NDFFIiBkYzpmb3JtYXQ9ImltYWdlL2pwZWciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSIiIHhtcDpDcmVhdGVEYXRlPSIyMDIxLTAxLTIwVDE3OjUwOjEzLTAzOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMS0wMS0yMFQxODozNDoyNC0wMzowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyMS0wMS0yMFQxODozNDoyNC0wMzowMCI+IDx4bXBNTTpIaXN0b3J5PiA8cmRmOlNlcT4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOmMxNDdiYzE0LWM0ZDItMWU0NC04YmYyLTliMjdhNjVmM2FmOSIgc3RFdnQ6d2hlbj0iMjAyMS0wMS0yMFQxODozNDowNy0wMzowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIyLjEgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjb252ZXJ0ZWQiIHN0RXZ0OnBhcmFtZXRlcnM9ImZyb20gaW1hZ2UvanBlZyB0byBhcHBsaWNhdGlvbi92bmQuYWRvYmUucGhvdG9zaG9wIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJkZXJpdmVkIiBzdEV2dDpwYXJhbWV0ZXJzPSJjb252ZXJ0ZWQgZnJvbSBpbWFnZS9qcGVnIHRvIGFwcGxpY2F0aW9uL3ZuZC5hZG9iZS5waG90b3Nob3AiLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOmE4OGE0YzY5LWU4ZDQtYTA0Ny05NmFiLTc0NDFkOTUxMDUxOSIgc3RFdnQ6d2hlbj0iMjAyMS0wMS0yMFQxODozNDowNy0wMzowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIyLjEgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo5Y2I3YTgyZC0wM2E1LTkyNDktOWMyYi1kZDA0Mzc0NjYwNzgiIHN0RXZ0OndoZW49IjIwMjEtMDEtMjBUMTg6MzQ6MjQtMDM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMi4xIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY29udmVydGVkIiBzdEV2dDpwYXJhbWV0ZXJzPSJmcm9tIGFwcGxpY2F0aW9uL3ZuZC5hZG9iZS5waG90b3Nob3AgdG8gaW1hZ2UvanBlZyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iZGVyaXZlZCIgc3RFdnQ6cGFyYW1ldGVycz0iY29udmVydGVkIGZyb20gYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCB0byBpbWFnZS9qcGVnIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDowYmZmYzkyYi05ZTU0LWRjNDEtOTU4Yi0zOTJiOWQ3ZjQ5YmEiIHN0RXZ0OndoZW49IjIwMjEtMDEtMjBUMTg6MzQ6MjQtMDM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMi4xIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6OWNiN2E4MmQtMDNhNS05MjQ5LTljMmItZGQwNDM3NDY2MDc4IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOmE4OGE0YzY5LWU4ZDQtYTA0Ny05NmFiLTc0NDFkOTUxMDUxOSIgc3RSZWY6b3JpZ2luYWxEb2N1bWVudElEPSIzQjg2RjEwQjI1MTlCQkE5QUJDNkM1RTdDNUFFOTQxRSIvPiA8cGhvdG9zaG9wOlRleHRMYXllcnM+IDxyZGY6QmFnPiA8cmRmOmxpIHBob3Rvc2hvcDpMYXllck5hbWU9IiBCUllDTE9VRCIgcGhvdG9zaG9wOkxheWVyVGV4dD0iIEJSWUNMT1VEIi8+IDwvcmRmOkJhZz4gPC9waG90b3Nob3A6VGV4dExheWVycz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPD94cGFja2V0IGVuZD0idyI/Pv/uAA5BZG9iZQBkAAAAAAH/2wCEAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwBBwcHDQwNGBAQGBQODg4UFA4ODg4UEQwMDAwMEREMDAwMDAwRDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDP/AABEIALgBMAMBEQACEQEDEQH/3QAEACb/xAGiAAAABwEBAQEBAAAAAAAAAAAEBQMCBgEABwgJCgsBAAICAwEBAQEBAAAAAAAAAAEAAgMEBQYHCAkKCxAAAgEDAwIEAgYHAwQCBgJzAQIDEQQABSESMUFRBhNhInGBFDKRoQcVsUIjwVLR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";


        byte[] data = Convert.FromBase64String(imgBaseJpg);

            MemoryStream bmpStream = new MemoryStream(data);
            image = System.Drawing.Image.FromStream(bmpStream);
            imgBitmap = new Bitmap(image);

            PointF idStampPosition = new PointF(56f, 148f);
            RectangleF timeStampPosition = new RectangleF(92f, 60f, 120f, 48f);

            using (Graphics graphics = Graphics.FromImage(imgBitmap))
            {
                graphics.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;
                using (Font arialFont = new Font("Arial", 16, FontStyle.Bold))
                {
                    graphics.DrawString(DadosContrato.Carimbo.IDCarimbo, arialFont, new SolidBrush(Color.White), idStampPosition);
                    StringFormat stringFormat = new StringFormat();
                    stringFormat.Alignment = StringAlignment.Center;
                    stringFormat.LineAlignment = StringAlignment.Center;
                    string dataHoraUTC = DateTime.Parse(DadosContrato.Carimbo.DataHoraUTC.Replace(" (UTC)", "")).AddHours(TimeZone.CurrentTimeZone.GetUtcOffset(DateTime.Now).TotalHours).ToString();

                    //SIG 133247 - incluído Convert.ToDateTime(DadosContrato.DataCarimboTempo) <= DadosContrato.DataInclusao
                    if ((Convert.ToDateTime(DadosContrato.DataCarimboTempo) > Convert.ToDateTime(dataHoraUTC)) && Convert.ToDateTime(DadosContrato.DataCarimboTempo) <= DadosContrato.DataInclusao)
                    {
                        dataHoraUTC = DadosContrato.DataCarimboTempo;
                    }

                    //SIG 130095
                    if (!string.IsNullOrEmpty(DadosContrato.DataInclusaoAssinatContratoP))
                    {
                        if (Convert.ToDateTime(dataHoraUTC) < Convert.ToDateTime(DadosContrato.DataInclusaoAssinatContratoP))
                        {
                            dataHoraUTC = DadosContrato.DataInclusaoAssinatContratoP.ToString();
                        }
                    }

                    graphics.DrawString(dataHoraUTC, arialFont, new SolidBrush(Color.White), timeStampPosition, stringFormat);
                }
            }

            var codecParams = new System.Drawing.Imaging.EncoderParameters(1);
            var ratio = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 100L);
            codecParams.Param[0] = ratio;

            var imgCodecInfo = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders();
            int jpeg;
            for (jpeg = 0; jpeg < imgCodecInfo.Length; ++jpeg)
            {
                if (imgCodecInfo[jpeg].MimeType.Equals(@"image/" + tipoImagem))
                    break;
            }
            //var selo = "data:image/" + tipoImagem + ";base64," + ImagemHelper.ImageToBase64(imgBitmap, imgCodecInfo[jpeg], codecParams);
            var selo = ImagemHelper.ImageToBase64(imgBitmap, imgCodecInfo[jpeg], codecParams);
            return selo;
        }

        public System.Drawing.Image Base64ToImage(string base64String)
        {
            // Convert base 64 string to byte[]
            byte[] imageBytes = Convert.FromBase64String(base64String);
            // Convert byte[] to Image
            using (var ms = new MemoryStream(imageBytes, 0, imageBytes.Length))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                return image;
            }
        }

        private RelatorioContrato PrepararDadosContrato(long NumeroContrato)
        {
            RelatorioContrato relatorio = new RelatorioContrato();
            try
            {                
                ObjetoContrato Contrato = new ObjetoContrato(NumeroContrato);

                ////if (!Contrato.internet)
                ////{
                ////    this.registrarAlerta("O contrato não poderá ser gerado, pois não foi concedido por meio do sistema Auto Atendimento.");
                ////    return;
                ////}

                DadosBancarios dadosBancarios = null;

                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {     
                    relatorio = cliente.contrato.buscaInfoImpressaoEmprestimoSemContrato(NumeroContrato);

                    //Campanha Desconto
                    using (Cliente<IServicoConcessao> client = new Cliente<IServicoConcessao>())
                    {
                        relatorio.tipoContrato = client.contrato.ConsultarTipoContrato(Contrato.idTipoContratoEmpto);
                    }
                    relatorio.numeroContrato = Contrato.numero;
                    relatorio.ContratacaoInternet = Contrato.internet;
                    relatorio.mutuario = Contrato.mutuario;
                    relatorio.valorMaximo = Contrato.valorMaximo;
                    relatorio.prazo = Contrato.totalParcelas;
                    relatorio.valorSolicitado = (double)Contrato.valorContrato;
                    relatorio.DataCredito = Convert.ToDateTime(Contrato.dataCredito);
                    relatorio.dataAssinatura = (DateTime)Contrato.dataAssinatura;
                    relatorio.conta = cliente.contrato.consultarContaBancaria(0, relatorio.conta.id, 0)[0];
                    relatorio.fiadores = new Avalistas[] { new Avalistas() { id = 0 }, new Avalistas() { id = 0 } };
                    relatorio.ContratoAntigoSemMinuta = true; // SIG 129005 - Identifica na impressão que a chamada da impressão parte daqui e não há minuta gravada na base
                    relatorio.DataInclusao = Contrato.DataInclusao;

                    //Antes de abrir a pasta que exibe o contrato, vamos verificar se existe minuta para o contrato.
                    LeioutContrato leiout = new LeioutContrato();
                    using (Cliente<IServicoContrato> client = new Cliente<IServicoContrato>())
                    {
                        //leiout = client.contrato.consultarleiout(relatorio.tipoContrato.id, relatorio.dataAssinatura);

                        List<Contrato> listContratosQuitados = null;
                        listContratosQuitados = client.contrato.consultarContratosQuitados(NumeroContrato);
                        if (!listContratosQuitados.Count.Equals(0))

                        {
                            listContratosQuitados.ForEach(x =>
                            {
                                relatorio.contratosQuitados += ", " + x.numero.ToString();
                            });
                            relatorio.contratosQuitados = relatorio.contratosQuitados.Substring(2, relatorio.contratosQuitados.Length - 2);
                        }

                    }

                }
                return relatorio;
            }
            catch (Exception ex)
            {
                throw new Planus.Componentes.ExcecaoPlanus(ex.Message);
            }
            //finally
            //{
            //    //Porcentagem = 100;
            //}
        }
    }
}