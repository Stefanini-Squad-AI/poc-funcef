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

using System;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using System.IO;
using Novacode;
using FUNCEF.Planus.Componentes;
using Aspose.Words.Saving;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using System.Text.RegularExpressions;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.ModeloContrato
{
    public partial class ImpressaoModelo : PaginaSegura
    {

        private int idTbTipoContr
        {
            get
            {
                string qs = Request.QueryString["IdTipo"];

                if (!String.IsNullOrEmpty(qs))
                {
                    return Convert.ToInt16(qs);
                }
                else
                {
                    return 0;
                }
               
            }
        }

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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    this.exibeModeloRelatorio(idTbTipoContr,  null);
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }


        #region ModeloContrato
        private void exibeModeloRelatorio(int IdContrEmptmo, DateTime? DataInicioVigencia)
        {
            LeioutContrato leiout = new LeioutContrato();
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                leiout = cliente.contrato.consultarleiout(IdContrEmptmo, DataInicioVigencia);
            }

            //Verifica e cria o diretorio temporario para os contratos
            if (!System.IO.File.Exists("C:\\WebPlanus\\Temp"))
            {
                Directory.CreateDirectory("C:\\WebPlanus\\Temp");
            }

            DocX WordDoc = null;

            using (Stream str = new MemoryStream(leiout.leioutContrato))
            {
                WordDoc = DocX.Load(str);

                WordDoc.ReplaceText("<NOME>", "________________________________________________________________________", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.SubsetMatch);
                WordDoc.ReplaceText("<MATRICULA>", "_________________", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                WordDoc.ReplaceText("<CPF>", "_______________________", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                
                //colocar todas as Tags em branco <>
                Regex regex = new Regex(@"\<.*?\>");
                var tags = regex.Matches(WordDoc.Text);

                foreach (var tag in tags)
                {
                    WordDoc.ReplaceText(tag.ToString(), "", false, System.Text.RegularExpressions.RegexOptions.IgnoreCase, null, null, MatchFormattingOptions.ExactMatch);
                }

                WordDoc.SaveAs("C:\\WebPlanus\\Temp\\ModeloContrato" + IdContrEmptmo.ToString() + ".docx");
            }

            Byte[] contrato = null;

            if (File.Exists("C:\\WebPlanus\\Temp\\ModeloContrato" + IdContrEmptmo.ToString() + ".pdf"))
            {
                File.Delete("C:\\WebPlanus\\Temp\\ModeloContrato" + IdContrEmptmo.ToString() + ".pdf");
            }

            try
            {
                if (!this.geraPDF(IdContrEmptmo))
                {
                    throw new ExcecaoPlanus("Erro ao gerar PDF.");
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            contrato = File.ReadAllBytes("C:\\WebPlanus\\Temp\\ModeloContrato" + IdContrEmptmo.ToString() + ".pdf");

            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Type", "application/pdf");
            Response.AddHeader("Content-Disposition", "inline");
            Response.BinaryWrite(contrato);
            Response.Flush();
            Response.End();
        }

        private bool geraPDF(int IdContrEmptmo)
        {
            return ConvertDocToPDF("C:\\WebPlanus\\Temp\\ModeloContrato" + IdContrEmptmo.ToString() + @".docx", 8.5, 11, "C:\\WebPlanus\\Temp\\ModeloContrato" + IdContrEmptmo.ToString() + @".pdf");
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
    }
}