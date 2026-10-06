
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System.Text.RegularExpressions;
using System.Data;
using System.Web;

namespace FUNCEF.Planus.WebEmprestimo.Web.Boleto
{
    //Campanha Desconto
    public class EmprestimoUtils
    {
        public EmprestimoUtils()            
        {
            
        }

        public static byte[] GerarBoletoEmprestimo(long contratoEmptmo, DateTime dataVenc, string protocolo, int tipoMov, EmptmoDocFinanceiroDTO documentoFinanceiro)
        {
            EmptmoDocFinanceiroDTO docFinanceiro = new EmptmoDocFinanceiroDTO();
            
            try
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    if (documentoFinanceiro == null)
                        docFinanceiro = cliente.contrato.RetornarDocumentoEnviado(Convert.ToDouble(contratoEmptmo), tipoMov, 0, Convert.ToDateTime(dataVenc));
                    else
                    {
                        docFinanceiro = documentoFinanceiro;
                    }

                    string erro = String.Empty;
                    if (string.IsNullOrEmpty(docFinanceiro.msgErro))
                    {
                        var boleto = new BoletoEmprestimo(docFinanceiro.numDocumento, docFinanceiro.portadorForma, tipoMov);

                        var boletoDTO = boleto.GetDTO();

                        //DataTable dtBoleto = new DataTable();

                        //dtBoleto.Columns.Add("Aceite", typeof(string));
                        //dtBoleto.Columns.Add("Agencia", typeof(string));
                        //dtBoleto.Columns.Add("Bairro", typeof(string));
                        //dtBoleto.Columns.Add("Beneficiario", typeof(string));
                        //dtBoleto.Columns.Add("Carteira", typeof(string));
                        //dtBoleto.Columns.Add("CEP", typeof(string));
                        //dtBoleto.Columns.Add("Cidade", typeof(string));
                        //dtBoleto.Columns.Add("CodDocumento", typeof(double));
                        //dtBoleto.Columns.Add("CodigoBaixa", typeof(string));
                        //dtBoleto.Columns.Add("CodigoBeneficiario", typeof(string));
                        //dtBoleto.Columns.Add("CodigoDeBarras", typeof(string));
                        //dtBoleto.Columns.Add("CPF", typeof(string));
                        //dtBoleto.Columns.Add("DataConcessao", typeof(string));
                        //dtBoleto.Columns.Add("DataDeProcessamento", typeof(string));
                        //dtBoleto.Columns.Add("DataDeVencimento", typeof(string));
                        //dtBoleto.Columns.Add("DataDoDocumento", typeof(string));
                        //dtBoleto.Columns.Add("Especie", typeof(string));
                        //dtBoleto.Columns.Add("EspecieDoc", typeof(string));
                        //dtBoleto.Columns.Add("Estado", typeof(string));
                        //dtBoleto.Columns.Add("FacEvAtiv", typeof(string));
                        //dtBoleto.Columns.Add("ImagemCodigoDeBarras", typeof(byte[]));
                        //dtBoleto.Columns.Add("Inscricao", typeof(string));
                        //dtBoleto.Columns.Add("LocalDePagamento", typeof(string));
                        //dtBoleto.Columns.Add("Logradouro", typeof(string));
                        //dtBoleto.Columns.Add("Matricula", typeof(string));
                        //dtBoleto.Columns.Add("Modalidade", typeof(string));
                        //dtBoleto.Columns.Add("NomeDaPessoa", typeof(string));
                        //dtBoleto.Columns.Add("NossoNumero", typeof(string));
                        //dtBoleto.Columns.Add("NumeroContrato", typeof(string));
                        //dtBoleto.Columns.Add("NumeroDaContaRespo", typeof(string));
                        //dtBoleto.Columns.Add("NumeroDoDocumento", typeof(string));
                        //dtBoleto.Columns.Add("ObservacoesAdicionais", typeof(string));
                        //dtBoleto.Columns.Add("Quantidade", typeof(int));
                        //dtBoleto.Columns.Add("REF", typeof(string));
                        //dtBoleto.Columns.Add("RepresentacaoNumerica", typeof(string));
                        //dtBoleto.Columns.Add("ValorDoDesconto", typeof(double));
                        //dtBoleto.Columns.Add("ValorDoDocumento", typeof(string));
                        //dtBoleto.Columns.Add("VrDocumento", typeof(double));

                        //dtBoleto.Rows.Add(boletoDTO.Aceite, boletoDTO.Agencia, boletoDTO.Bairro, boletoDTO.Beneficiario, boletoDTO.Carteira, boletoDTO.CEP, boletoDTO.Cidade, boletoDTO.CodDocumento,
                        //                  boletoDTO.CodigoBaixa, boletoDTO.CodigoBeneficiario, boletoDTO.CodigoDeBarras, boletoDTO.CPF, boletoDTO.DataConcessao, boletoDTO.DataDeProcessamento,
                        //                  boletoDTO.DataDeVencimento, boletoDTO.DataDoDocumento, boletoDTO.Especie, boletoDTO.EspecieDoc, boletoDTO.Estado, boletoDTO.FacEvAtiv, boletoDTO.ImagemCodigoDeBarras,
                        //                  boletoDTO.Inscricao, boletoDTO.LocalDePagamento, boletoDTO.Logradouro, boletoDTO.Matricula, boletoDTO.Modalidade, boletoDTO.NomeDaPessoa, boletoDTO.NossoNumero,
                        //                  boletoDTO.NumeroContrato, boletoDTO.NumeroDaContaRespo, boletoDTO.NumeroDoDocumento, boletoDTO.ObservacoesAdicionais, boletoDTO.Quantidade, boletoDTO.REF,
                        //                  boletoDTO.RepresentacaoNumerica, boletoDTO.ValorDoDesconto, boletoDTO.ValorDoDocumento, boletoDTO.VrDocumento);

                        //ReportDataSource boletods = new ReportDataSource("boleto", dtBoleto);

                        ////Original
                        //LocalReport report = new LocalReport();
                        //Assembly dto = Assembly.GetAssembly(typeof(DadosBoleto));
                        //var reportViewBoleto = "FUNCEF.Planus.WebEmprestimo.Web.Boleto.BoletoEmprestimo.rdlc";
                        //Stream reportStream = dto.GetManifestResourceStream(reportViewBoleto);
                        //report.LoadReportDefinition(reportStream);
                        //report.DataSources.Add(boletods);
                        //byte[] mybytes = report.Render("PDF");

                        string deviceinfo = "<DeviceInfo>" +
                                            "  <OutputFormat>PDF</OutputFormat>" +
                                            "  <PageWidth>21cm</PageWidth>" +
                                            "  <PageHeight>29cm</PageHeight>" +
                                            "  <MarginTop>0.1in</MarginTop>" +
                                            "  <MarginLeft>0in</MarginLeft>" +
                                            "  <MarginRight>0in</MarginRight>" +
                                            "  <MarginBottom>0.1in</MarginBottom>" +
                                            "  </DeviceInfo>";

                        Warning[] warnings = null;
                        string[] streamIds = null;
                        string mimeType = string.Empty;
                        string encoding = string.Empty;
                        string extension = string.Empty;

                        ReportDataSource boletods = new ReportDataSource("boleto", new List<Tipos.Boleto>() { boletoDTO });
                        ReportViewer boletoImpressao = new ReportViewer();

                        boletoImpressao.Visible = true;
                        //boletoImpressao.LocalReport.DataSources.Clear();
                        //boletoImpressao.Reset();
                        boletoImpressao.LocalReport.ReportPath = "Boleto/BoletoEmprestimo.rdlc";
                        boletoImpressao.LocalReport.DataSources.Add(boletods);
                        boletoImpressao.LocalReport.Refresh();

                        byte[] mybytes = boletoImpressao.LocalReport.Render("PDF", deviceinfo, out mimeType, out encoding, out extension, out streamIds, out warnings);

                        using (FileStream fs = new FileStream("C:/ProjetosWeb/Boleto.pdf", FileMode.Create))
                        {
                            fs.Write(mybytes, 0, mybytes.Length);
                        }

                        return mybytes;
                    }
                    else
                    {
                        throw new Exception(docFinanceiro.msgErro);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}