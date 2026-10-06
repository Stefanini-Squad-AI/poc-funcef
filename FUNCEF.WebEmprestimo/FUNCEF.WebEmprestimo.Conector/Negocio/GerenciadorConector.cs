#region SOL 258704/17636 / PPM 1008709
/// - SOL 258704/17636 / PPM 1008709
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 12/08/2015
///
/// Descrição da Alteração:
/// Criação do Método ObterContaBancaria no conectorWeb.
/// 
#endregion
#region SOL 251082 / PPM 724410
/// Autor:
/// William Moreira da Silva
///
/// Data da Atualização:
/// 25/03/2015
///
/// Descrição da Alteração:
/// Alteração para o conector realizar concessões passando o numero do contrato
/// e um metodo para gerar o numero do contrato
#endregion

using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;
using System.ServiceModel;
using System.Text;
using System.Reflection;

namespace FUNCEF.Planus.WebEmprestimo.Conector.ComponentesBase
{
    public class GerenciadorConector
    {
        #region Enumeradores

        // Felipe A. Santos -  SOL 258704/17636 PPM 1008709 - incluído o ContaBancaria
        enum TipoValidacao { Concessao, Simulacao, Incluir, Validar, Assinatura, obterNumContrato, ContaBancaria };//William Moreira da Silva - SOL 251082

        #endregion

        #region Propriedades

        private const string versaoXML = "<?xml version=\"1.0\" encoding=\"utf-8\" ?> ";

        /// <summary>
        /// Dados do mutuário obtido através da matrícula informada
        /// </summary>
        private Mutuario mutuario
        {
            get;
            set;
        }

        #endregion

        #region Geração de XML

        private void calcularSuspensao(Parametros parametros, Concessao dadosConcessao, out double? valorParcela, out DateTime? dataTerminoSuspensao)
        {
            TipoSuspensao tipoSuspensao = this.consultarTipoSuspensao(parametros.idTipoSuspensao, parametros.idTipoContrato);

            int meses = parametros.mesesSuspensao.Value - 1;
            dataTerminoSuspensao = dadosConcessao.dataPrimeiraParcela.Value.AddMonths(meses);

            if (tipoSuspensao.percentual.HasValue)
            {
                valorParcela = (dadosConcessao.valorPrestacao.Value * tipoSuspensao.percentual.Value / 100);
            }
            else
                valorParcela = null;

        }

        private string gerarXmlSuspensao(Parametros parametros, Concessao dadosConcessao, bool geraTagReducaoParcela)
        {
            StringBuilder xml = new StringBuilder();

            if (parametros.mesesSuspensao != null)
            {
                double? valorParcelaSuspensa;
                DateTime? dataTerminoSuspensao;

                this.calcularSuspensao(parametros, dadosConcessao, out valorParcelaSuspensa, out dataTerminoSuspensao);

                if (valorParcelaSuspensa.HasValue)
                {
                    if (geraTagReducaoParcela)
                    {
                        xml.Append(string.Format(" <empReducaoParcela>{0}</empReducaoParcela> ", parametros.mesesSuspensao));
                    }

                    xml.Append(string.Format(" <empVlrParcelaReduzida>{0}</empVlrParcelaReduzida> ", valorParcelaSuspensa));
                    xml.Append(string.Format(" <empDtFimSuspensao>{0}</empDtFimSuspensao> ", dataTerminoSuspensao));

                    return xml.ToString();
                }
                else
                {
                    return string.Empty;
                }
            }
            else
            {
                return string.Empty;
            }

        }
        private string gerarTagAssinatura(int idTitular, int idMutuario, int idTipoContrato, int? flgtrataassinat) // Thiago Melo SOL 204452 KTN 1976411 
        {
            int temAssinatura = Convert.ToInt32(this.verificarAssinatura(idTitular, idMutuario, idTipoContrato, flgtrataassinat)); // Thiago Melo SOL 204452 KTN 1976411             

            return string.Format(" <empAssinaturaContr>{0}</empAssinaturaContr> ", temAssinatura);
        }
        private string gerarXmlContaBancaria(int idMutuario)
        {
            DadosBancarios conta = this.consultarDadosBancarios(idMutuario);

            StringBuilder xml = new StringBuilder();

            xml.Append(string.Format(" <empBancoPag>{0}</empBancoPag> ", conta.numeroBanco));
            xml.Append(string.Format(" <empAgenciaPag>{0}</empAgenciaPag> ", conta.agencia));
            xml.Append(string.Format(" <empContaPag>{0}</empContaPag> ", conta.contaCorrente));

            return xml.ToString();
        }

        private string gerarXmlContratosAQuitar(List<Contrato> contratos)
        {
            StringBuilder xml = new StringBuilder();

            xml.Append(" <empQuitacoes> ");

            for (int i = 0; i < contratos.Count; i++)
            {
                xml.Append(string.Format(" <empContrAQuitar id='{0}'> ", (i + 1)));

                xml.Append(string.Format(" <empIdContratoEmptmo>{0}</empIdContratoEmptmo> ", contratos[i].numero));
                xml.Append(string.Format(" <empIdTipoContrEmptmo>{0}</empIdTipoContrEmptmo> ", contratos[i].tipo.id));
                xml.Append(string.Format(" <empDescTipoContrato>{0}</empDescTipoContrato> ", contratos[i].tipo.descricao));
                xml.Append(string.Format(" <empObrigaQuitacao>{0}</empObrigaQuitacao> ", contratos[i].quitacaoObrigatoria));
                xml.Append(string.Format(" <empVlrSolicitado>{0}</empVlrSolicitado> ", contratos[i].valorContrato));
                xml.Append(string.Format(" <empDataCredito>{0}</empDataCredito> ", contratos[i].dataCredito));
                xml.Append(string.Format(" <empPrazo>{0}</empPrazo> ", contratos[i].totalParcelas));
                xml.Append(string.Format(" <empParcelasPagas>{0}</empParcelasPagas> ", contratos[i].parcelasPagas));
                xml.Append(string.Format(" <empVlrParcela>{0}</empVlrParcela> ", contratos[i].valorParcela));
                //xml.Append(string.Format(" <empVlrSaldoDev>{0}</empVlrSaldoDev> ", contratos[i].valorEmAberto));//William Moreira da Silva - SOL 200892 KTN - 1941984
                xml.Append(string.Format(" <empVlrSaldoDev>{0}</empVlrSaldoDev> ", contratos[i].saldoDevedor));//William Moreira da Silva - SOL 200892 KTN - 1941984
                xml.Append(string.Format(" <empVlrSaldoAQuitar>{0}</empVlrSaldoAQuitar> ", contratos[i].valorAQuitar));

                xml.Append(" </empContrAQuitar> ");
            }

            xml.Append(" </empQuitacoes> ");

            return xml.ToString();

        }

        private string gerarXmlTotalQuitacoes(List<Contrato> contratos)
        {
            StringBuilder xml = new StringBuilder();

            int quantidadeContratos = 0;
            double totalSaldoDevedor = 0d;
            int totalparcelasPagas = 0;
            int totalparcelasAPagar = 0;

            if (contratos.Count > 0)
            {
                quantidadeContratos = contratos.Count;
                totalSaldoDevedor = contratos.Sum(c => c.valorEmAberto);
                totalparcelasPagas = contratos.Sum(c => c.parcelasPagas);
                totalparcelasAPagar = contratos.Sum(c => c.numeroParcelasAtrasadas);
            }

            xml.Append(" <empTotalQuitacoes> ");

            xml.Append(string.Format(" <empQtdContrAnt>{0}</empQtdContrAnt> ", quantidadeContratos));
            xml.Append(string.Format(" <empTotSaldoDev>{0}</empTotSaldoDev> ", totalSaldoDevedor));
            xml.Append(string.Format(" <empTotPclPagas>{0}</empTotPclPagas> ", totalparcelasPagas));
            xml.Append(string.Format(" <empTotPclAPagar>{0}</empTotPclAPagar> ", totalparcelasAPagar));

            xml.Append(" </empTotalQuitacoes> ");

            return xml.ToString();



        }

        private string gerarXmlItensConcessao(List<ItemContrato> itensConcessao)
        {

            StringBuilder xml = new StringBuilder();

            //Pega somente itens de concessão onde centraliza = 0 
            List<ItemContrato> itens = itensConcessao.FindAll(t1 => t1.centraliza == 0 && t1.tipoEvento.chave == TipoEvento.concessao.chave);

            xml.Append(" <empDescontos> ");

            //Começa do item 1 pois o Valor Solicitado dos itens de concessão não entra aqui.
            for (int i = 1; i < itens.Count; i++)
            {
                xml.Append(string.Format(" <empItem id='{0}' Descricao='{1}'>{2}</empItem> ", itens[i].id, HttpUtility.HtmlEncode(itens[i].descricao), itens[i].valor));
            }

            xml.Append(" </empDescontos> ");

            return xml.ToString();

        }

        private string gerarXmlPrazo(int prazo)
        {

            StringBuilder xml = new StringBuilder();

            xml.Append(" <empPrazo> ");

            for (int i = 0; i < prazo; i++)
            {
                xml.Append(string.Format(" <Prazo>{0}</Prazo> ", (i + 1)));
            }

            xml.Append(" </empPrazo> ");

            return xml.ToString();

        }

        private string gerarXmlSimulacoes(Parametros parametros, Concessao dadosConcessao, List<ItemContrato> itensConcessao)
        {
            StringBuilder xml = new StringBuilder();

            xml.Append(" <empSimulacoes> ");
            xml.Append(" <empSimulacao id='1'> ");

            xml.Append(string.Format(" <empPrazo>{0}</empPrazo> ", dadosConcessao.numeroParcelas));
            // Thiago Melo SOL 205979 Kintana 1991779
            xml.Append(string.Format(" <empVlrBruto>{0}</empVlrBruto> ", dadosConcessao.valorSolicitado));
            //xml.Append(string.Format(" <empVlrBruto>{0}</empVlrBruto> ", dadosConcessao.valorMaximo));
            // Thiago Melo SOL 205979 Kintana 1991779

            //itens de concessão (Descontos)
            xml.Append(this.gerarXmlItensConcessao(itensConcessao));

            xml.Append(string.Format(" <empVlrLiquido>{0}</empVlrLiquido> ", dadosConcessao.valorLiquido));
            xml.Append(string.Format(" <empVlrParcela>{0}</empVlrParcela> ", dadosConcessao.valorPrestacao));

            //Gera Tags de suspensão quando houver
            xml.Append(this.gerarXmlSuspensao(parametros, dadosConcessao, false));

            xml.Append(" </empSimulacao> ");
            xml.Append(" </empSimulacoes> ");

            return xml.ToString();

        }

        private string gerarXmlErro(Parametros parametros, string mensagem)
        {
            StringBuilder xml = new StringBuilder();

            xml.Append(versaoXML);

            xml.Append(" <resultado> ");

            xml.Append(string.Format(" <vMatricula>{0}</vMatricula> ", parametros.matricula));
            xml.Append(string.Format(" <vIdTipoContrEmptmo>{0}</vIdTipoContrEmptmo> ", parametros.idTipoContrato));
            xml.Append(string.Format(" <empCodigoErro>{0}</empCodigoErro> ", 1));
            xml.Append(string.Format(" <empMensagemErro>{0}</empMensagemErro> ", HttpUtility.HtmlEncode(mensagem)));

            xml.Append(" </resultado> ");

            return xml.ToString();

        }

        private string gerarXmlRodape()
        {
            StringBuilder xml = new StringBuilder();

            xml.Append(" <empCodigoErro>0</empCodigoErro> ");
            xml.Append(" <empMensagemErro></empMensagemErro> ");
            xml.Append(" <empMensagemAviso></empMensagemAviso> ");

            return xml.ToString();

        }


        #endregion

        #region Métodos Públicos

        private string tratarMensagemConcessao(List<string> listaMensagens)
        {
            if (listaMensagens.Count > 0)
            {
                StringBuilder msg = new StringBuilder();

                for (int i = 0; i < listaMensagens.Count; i++)
                {
                    msg.Append(listaMensagens[i]);
                }

                return msg.ToString();
            }
            else
            {
                return string.Empty;
            }
        }

        public string obterXmlConcessao(Parametros parametros)
        {
            try
            {
                this.validarParametros(ref parametros, TipoValidacao.Concessao);

                //Verifica se é Auto Patrocinio "MA" = 1 SENÃO 0
                int autoPatrocinio = mutuario.plano.flagInterno.ToUpper().Equals("MA") ? 1 : 0;

                List<ItemContrato> itensConcessao = new List<ItemContrato>();
                List<Contrato> contratos = new List<Contrato>();
                Concessao dadosConcessao = new Concessao();

                this.verificaSituacaoContrato(parametros.idTipoContrato);//William Moreira da Silva - SOL 214635 KTN 2044698
                //William Moreira da Silva - SOL 248114

                //Calcula concessão e obtém contratos a quitar, itens e dados de concessão
                List<string> listaMensagens = new List<string>();
                contratos = this.calcularConcessao(parametros, ref dadosConcessao, ref itensConcessao, out listaMensagens);

                //this.verificaSituacaoContrato(parametros.idTipoContrato);//William Moreira da Silva - SOL 214635 KTN 2044698
                //William Moreira da Silva - SOL 248114

                if (listaMensagens.Count > 0)
                {
                    return this.gerarXmlErro(parametros, this.tratarMensagemConcessao(listaMensagens));
                }

                #region Gerar XML

                StringBuilder xml = new StringBuilder();

                xml.Append(versaoXML);

                xml.Append(" <resultado> ");

                xml.Append(string.Format(" <vMatricula>{0}</vMatricula> ", mutuario.matricula));
                xml.Append(string.Format(" <vIdTipoContrEmptmo>{0}</vIdTipoContrEmptmo> ", parametros.idTipoContrato));
                xml.Append(string.Format(" <empAutoPatrocinio>{0}</empAutoPatrocinio> ", autoPatrocinio));
                xml.Append(string.Format(" <empReducaoParcela>{0}</empReducaoParcela> ", this.calcularMesesSuspensao(parametros, dadosConcessao)));
                xml.Append(string.Format(" <empMargemConsignavel>{0}</empMargemConsignavel> ", dadosConcessao.valorMargem));
                xml.Append(string.Format(" <empDataCredito>{0}</empDataCredito> ", dadosConcessao.dataCredito));
                xml.Append(string.Format(" <empSaldoQuitacao>{0}</empSaldoQuitacao> ", dadosConcessao.valorAQuitar));
                xml.Append(string.Format(" <dtprimeira>{0:dd/MM/yyyy}</dtprimeira> ", dadosConcessao.dataPrimeiraParcela));//William Moreira da Silva SOL 209878 KINTANA 2026018

                //Dados da Conta Corrente
                xml.Append(this.gerarXmlContaBancaria(mutuario.id));

                //Assinatura                
                // Thiago Melo SOL 204452 KTN 1976411 
                xml.Append(this.gerarTagAssinatura(mutuario.idTitular, mutuario.id, parametros.idTipoContrato, null));
                // Thiago Melo SOL 204452 KTN 1976411 

                //Contratos à quitar
                xml.Append(this.gerarXmlContratosAQuitar(contratos));

                //Total Contrato à quitar
                xml.Append(this.gerarXmlTotalQuitacoes(contratos));

                //Simulações
                xml.Append(this.gerarXmlSimulacoes(parametros, dadosConcessao, itensConcessao));

                //Prazo
                xml.Append(this.gerarXmlPrazo(dadosConcessao.prazoMaximo));

                //Rodape
                xml.Append(this.gerarXmlRodape());

                xml.Append(" </resultado> ");


                #endregion

                return xml.ToString();
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                return this.gerarXmlErro(parametros, erro.Detail.mensagemErro);
            }
            catch (Exception ex)
            {
                return this.gerarXmlErro(parametros, ex.Message);
            }

        }

        public string obterXmlSimulacao(Parametros parametros)
        {
            try
            {
                this.validarParametros(ref parametros, TipoValidacao.Simulacao);

                List<ItemContrato> itensConcessao = new List<ItemContrato>();
                List<Contrato> contratos = new List<Contrato>();
                Concessao dadosConcessao = new Concessao();

                this.verificaSituacaoContrato(parametros.idTipoContrato);//William Moreira da Silva - SOL 214635 KTN 2044698
                //William Moreira da Silva - SOL 248114

                //Calcula concessão e obtém contratos a quitar, itens e dados de concessão
                List<string> listaMensagens = new List<string>();
                contratos = this.calcularConcessao(parametros, ref dadosConcessao, ref itensConcessao, out listaMensagens);

                //this.verificaSituacaoContrato(parametros.idTipoContrato);//William Moreira da Silva - SOL 214635 KTN 2044698
                //William Moreira da Silva - SOL 248114

                if (listaMensagens.Count > 0)
                {
                    return this.gerarXmlErro(parametros, this.tratarMensagemConcessao(listaMensagens));
                }

                #region Gerar XML

                StringBuilder xml = new StringBuilder();

                xml.Append(versaoXML);

                xml.Append(" <resultado> ");

                xml.Append(string.Format(" <vMatricula>{0}</vMatricula> ", mutuario.matricula));
                xml.Append(string.Format(" <vIdTipoContrEmptmo>{0}</vIdTipoContrEmptmo> ", parametros.idTipoContrato));
                xml.Append(string.Format(" <empReducaoParcela>{0}</empReducaoParcela> ", this.calcularMesesSuspensao(parametros, dadosConcessao)));
                xml.Append(string.Format(" <empMargemConsignavel>{0}</empMargemConsignavel> ", dadosConcessao.valorMargem));
                xml.Append(string.Format(" <vVlrSolicitado>{0}</vVlrSolicitado> ", dadosConcessao.valorSolicitado));
                xml.Append(string.Format(" <vPrazo>{0}</vPrazo> ", parametros.prazo));
                xml.Append(string.Format(" <dtprimeira>{0:dd/MM/yyyy}</dtprimeira> ", dadosConcessao.dataPrimeiraParcela));//William Moreira da Silva SOL 209878 KINTANA 2026018

                //Contratos á quitar
                xml.Append(this.gerarXmlContratosAQuitar(contratos));

                //Simulações
                xml.Append(this.gerarXmlSimulacoes(parametros, dadosConcessao, itensConcessao));

                //Rodape
                xml.Append(this.gerarXmlRodape());

                xml.Append(" </resultado> ");

                #endregion

                return xml.ToString();
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                return this.gerarXmlErro(parametros, erro.Detail.mensagemErro);
            }
            catch (Exception ex)
            {
                return this.gerarXmlErro(parametros, ex.Message);
            }

        }

        public string obterXmlIncluirConcessao(Parametros parametros)
        {
            try
            {
                this.validarParametros(ref parametros, TipoValidacao.Incluir);

                //William Moreira da Silva - SOL 251082
                if (!string.IsNullOrEmpty(parametros.numeroContrato))
                {
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        if (parametros.numeroContrato.Trim() == "" || cliente.contrato.verificanumeroContrato(long.Parse(parametros.numeroContrato)))
                        {
                            return this.gerarXmlErro(parametros, "Número de contrato inválido.");
                        }
                    }
                }
                //William Moreira da Silva - SOL 251082

                List<ItemContrato> itensConcessao = new List<ItemContrato>();
                List<Contrato> contratos = new List<Contrato>();
                Concessao dadosConcessao = new Concessao();

                this.verificaSituacaoContrato(parametros.idTipoContrato);//William Moreira da Silva - SOL 214635 KTN 2044698
                //William Moreira da Silva - SOL 248114

                //Calcula concessão e obtém contratos a quitar, itens e dados de concessão
                List<string> listaMensagens = new List<string>();
                contratos = this.calcularConcessao(parametros, ref dadosConcessao, ref itensConcessao, out listaMensagens);

                //this.verificaSituacaoContrato(parametros.idTipoContrato);//William Moreira da Silva - SOL 214635 KTN 2044698
                //William Moreira da Silva - SOL 248114

                if (listaMensagens.Count > 0)
                {
                    return this.gerarXmlErro(parametros, this.tratarMensagemConcessao(listaMensagens));
                }

                //Grava concessão
                long numeroContrato = this.gravarConcessao(parametros, dadosConcessao, itensConcessao, contratos);

                #region Gerar XML

                StringBuilder xml = new StringBuilder();

                xml.Append(versaoXML);

                xml.Append(" <resultado> ");

                xml.Append(string.Format(" <vMatricula>{0}</vMatricula> ", mutuario.matricula));
                xml.Append(string.Format(" <vIdTipoContrEmptmo>{0}</vIdTipoContrEmptmo> ", parametros.idTipoContrato));

                //Gera Tags de suspensão quando houver
                xml.Append(this.gerarXmlSuspensao(parametros, dadosConcessao, true));

                xml.Append(string.Format(" <vVlrSolicitado>{0}</vVlrSolicitado> ", dadosConcessao.valorSolicitado));
                xml.Append(string.Format(" <vPrazo>{0}</vPrazo> ", dadosConcessao.numeroParcelas));
                xml.Append(string.Format(" <vIdContrAQuitar>{0}</vIdContrAQuitar> ", this.obterLista(contratos)));
                xml.Append(string.Format(" <vIdFornecedor>{0}</vIdFornecedor> ", "-1"));
                xml.Append(string.Format(" <vCodAutoEmprestimo>{0}</vCodAutoEmprestimo> ", parametros.codigoAutoEmprestimo));

                xml.Append(this.gerarXmlContaBancaria(mutuario.id));

                xml.Append(string.Format(" <empIdContratoEmptmo>{0}</empIdContratoEmptmo> ", numeroContrato));

                //Rodape
                xml.Append(this.gerarXmlRodape());

                xml.Append(" </resultado> ");

                #endregion

                return xml.ToString();

            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                return this.gerarXmlErro(parametros, erro.Detail.mensagemErro);
            }
            catch (Exception ex)
            {
                return this.gerarXmlErro(parametros, ex.Message);
            }

        }

        public string obterXmlValidarConcessao(Parametros parametros)
        {

            try
            {
                this.validarParametros(ref parametros, TipoValidacao.Validar);

                long numeroContrato = this.consultarAutoEmprestimo(parametros).Value;

                #region Gerar XML

                StringBuilder xml = new StringBuilder();

                xml.Append(versaoXML);

                xml.Append(" <resultado> ");

                xml.Append(string.Format(" <vCodAutoEmprestimo>{0}</vCodAutoEmprestimo> ", parametros.codigoAutoEmprestimo));
                xml.Append(string.Format(" <empIdContratoEmptmo>{0}</empIdContratoEmptmo> ", numeroContrato));

                //Rodape
                xml.Append(this.gerarXmlRodape());

                xml.Append(" </resultado> ");

                #endregion

                return xml.ToString();

            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                return this.gerarXmlErro(parametros, erro.Detail.mensagemErro);
            }
            catch (Exception ex)
            {
                return this.gerarXmlErro(parametros, ex.Message);
            }

        }

        public string obterXmlAssinaturaPadrao(Parametros parametros)
        {
            try
            {
                this.validarParametros(ref parametros, TipoValidacao.Assinatura);

                this.incluirContratoPadrao(parametros);

                #region Gerar XML

                StringBuilder xml = new StringBuilder();

                xml.Append(versaoXML);

                xml.Append(" <resultado> ");

                xml.AppendFormat(" <vMatricula>{0}</vMatricula> ", mutuario.matricula);
                xml.AppendFormat(" <vIdContratoPadrao>{0}</vIdContratoPadrao> ", parametros.idContratoPadraoIN);
                xml.AppendFormat(" <vNumContrato>{0}</vNumContrato> ", parametros.numeroContrato);
                xml.AppendFormat(" <vDataAssinatura>{0}</vDataAssinatura> ", parametros.dataAssinaturaIN);

                //Rodape
                xml.Append(this.gerarXmlRodape());

                xml.Append(" </resultado> ");

                #endregion

                return xml.ToString();

            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                return this.gerarXmlErro(parametros, erro.Detail.mensagemErro);
            }
            catch (Exception ex)
            {
                return this.gerarXmlErro(parametros, ex.Message);
            }

        }

        //William Moreira da Silva - SOL 251082
        public string obterXmlobterNumContrato(Parametros parametros)
        {
            try
            {
                this.validarParametros(ref parametros, TipoValidacao.obterNumContrato);

                StringBuilder xml = new StringBuilder();

                xml.Append(versaoXML);

                xml.Append(" <resultado> ");

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    xml.Append(string.Format(" <numContrato>{0}</numContrato> ", cliente.contrato.obterNumeroContrato().ToString()));
                }
                //Rodape
                xml.Append(this.gerarXmlRodape());

                xml.Append(" </resultado> ");

                return xml.ToString();
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                return this.gerarXmlErro(parametros, erro.Detail.mensagemErro);
            }
            catch (Exception ex)
            {
                return this.gerarXmlErro(parametros, ex.Message);
            }

        }
        //William Moreira da Silva - SOL 251082

        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início
        public string obterXmlContabancaria(Parametros parametros)
        {
            try
            {
                this.validarParametros(ref parametros, TipoValidacao.ContaBancaria);

                List<DadosBancarios> dadosBancarios = this.consultarDadosBancarios(parametros.matricula);
                
                StringBuilder xml = new StringBuilder();

                xml.Append(versaoXML);
                xml.Append(" <resultado> ");

                for (int i = 0; i < dadosBancarios.Count; i++)
                {
                    xml.Append(string.Format(" <contabancaria id={0}> ", "\"" + dadosBancarios[i].id + "\""));
                    xml.Append(string.Format(" <agencia>{0}</agencia> ", dadosBancarios[i].agencia));
                    xml.Append(string.Format(" <operacao>{0}</operacao> ", dadosBancarios[i].operacao));
                    xml.Append(string.Format(" <conta>{0}</conta> ", dadosBancarios[i].contaCorrente));
                    xml.Append(string.Format(" <flgcontapref>{0}</flgcontapref> ", dadosBancarios[i].contraPreferencial));
                    xml.Append(" </contabancaria> " );
                }
                
                xml.Append(" </resultado> ");
                return xml.ToString();
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                return this.gerarXmlErro(parametros, erro.Detail.mensagemErro);
            }
            catch (Exception ex)
            {
                return this.gerarXmlErro(parametros, ex.Message);
            }

        }
        // Felipe A. Santos -  SOL 258704/17636 PPM 1008709 - fim

        #endregion

        #region Métodos Web Empréstimo

        private string obterLista(List<Contrato> listaContratos)
        {
            StringBuilder contratos = new StringBuilder();

            listaContratos.FindAll(c => c.quitar == true && c.quitacaoObrigatoria == 1).ForEach(c => contratos.Append(c.numero).Append(";"));

            return contratos.ToString().TrimEnd(';', ' ');
        }

        private void validarConcessao(Parametros parametros, Concessao dadosConcessao)
        {

            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                string aviso = String.Empty;
                cliente.contrato.consultarOutrasDividas(mutuario.id, out aviso);
                cliente.contrato.consultarSuspensao(mutuario.id, parametros.idTipoContrato, dadosConcessao.dataCredito.Value, true, out aviso);//MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567
                //William Moreira da Silva - SOL 224562 KTN 2059616 - Inclusão do parametro veioConector, no caso true pois estamos no Conector
                //Será preciso passsar um boolean a mais aqui, para mudar a mensagem -- William Moreira da Silva
            }

            //SOL 200774 - KTN 1940120 - NILTON 15/02/13. SOLUÇÃO: COMENTAR VALIDAÇÃO 
            //if (dadosConcessao.numProtocolo == 0)
            //{
            //    throw new Exception("Número Único de Protocolo Obrigatório.");
            //}

            //Se foi informado meses de suspensão, verifica se é valido
            if (parametros.mesesSuspensao != null)
            {
                int meses = this.calcularMesesSuspensao(parametros, dadosConcessao);

                if (parametros.mesesSuspensao > meses)
                    throw new Exception("Meses de suspensão está maior do que permitido.");
            }

            //Verifica se mutuário possui Assinatura           

            // Thiago Melo SOL 204452 KTN 1976411 
            if (!this.verificarAssinatura(mutuario.idTitular, mutuario.id, parametros.idTipoContrato, null))
                // Thiago Melo SOL 204452 KTN 1976411 
                throw new Exception("Mutuário não possui Assinatura.");

            //Verifica de valor solicitado foi informado ou é menor que 0
            if (!dadosConcessao.valorSolicitado.HasValue || dadosConcessao.valorSolicitado < 0d)
                throw new Exception("Valor solicitado não informado.");

            //Verifica se o valor solicitado é maior que saldo a quitar
            if (dadosConcessao.grupoExcepcional != 1) // Xavier SOL 178579 Grupo de excepcionalização Valor Solicitado
            {
                if (dadosConcessao.valorSolicitado < (dadosConcessao.valorAQuitar + dadosConcessao.valorDescontos))
                    throw new Exception("O Valor Solicitado não pode ser menor que o Saldo a Quitar!");

                if (dadosConcessao.valorSolicitado > dadosConcessao.valorMaximo)
                    throw new Exception("O Valor Solicitado não pode ser maior que o Valor Máximo Permitido");
            }
            //Verifica se o prazo informado não é maior que prazo máximo permitido
            if (dadosConcessao.numeroParcelas > dadosConcessao.prazoMaximo)
                throw new Exception("Prazo informado é maior que prazo máximo permitido.");

            //Verifica se néumro de meses de suspensão é maior que o número de parcelas
            if (dadosConcessao.mesesSuspensao.HasValue && dadosConcessao.numeroParcelas < dadosConcessao.mesesSuspensao.Value)
            {
                string msg = string.Format("O Número máximo para suspensão é de: {0} parcela(s). Favor verificar.", dadosConcessao.numeroParcelas.Value - 1);
                throw new Exception(msg);
            }

        }

        private List<Contrato> calcularConcessao(Parametros parametros, ref Concessao dadosConcessao, ref List<ItemContrato> itensConcessao, out List<string> listaMensagens)
        {
            List<Contrato> contratos = new List<Contrato>();

            dadosConcessao = new Concessao
            {
                // Thiago Melo SOL 202795 KTN 1960324 ini
                //excepcional = true,
                excepcional = false,
                // Thiago Melo SOL 202795 KTN 1960324 fim
                financiamento = false,
                dataAssinatura = DateTime.Today,
                dataSolicitacao = DateTime.Today,
                dataReferencia = DateTime.Today,
                dataEvento = DateTime.Today,
                dataAtualiza = DateTime.Today,
                dataEfetiva = DateTime.Today,
                dataPrevista = DateTime.Today,
                valorMaximo = 0,
                valorSolicitado = parametros.valorSolicitado,
                numeroParcelas = parametros.prazo,
                mesesSuspensao = parametros.mesesSuspensao,
                veioConector = true //William Moreira da Silva SOL 205183 KTN 1984449
            };

            //Contratos Selecionados à Quitar
            List<long> contratosSelecionados = this.validarContratosAQuitar(parametros.contratosAQuitar);

            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {                                                                                                                                                         //BRUNO AZEVEDO SOL213592_KTN2040335//Sadi FreireSOL213592_KTN2040335 (de false para true)
                contratos = cliente.contrato.calcular(mutuario.id, parametros.idTipoContrato, parametros.matricula, ref dadosConcessao, ref itensConcessao, contratosSelecionados, out listaMensagens, true, null, null, false);// Thiago Melo SOL 206149

                //William Moreira da Silva - SOL 229282 PPM 384002
                TipoContrato tipoContrato = new TipoContrato();
                tipoContrato = cliente.contrato.ConsultarTipoContrato(parametros.idTipoContrato);
                string msg;
                cliente.contrato.consultarContratosAnteriores(mutuario.id, mutuario.id, DateTime.Parse(dadosConcessao.dataCredito.ToString()), tipoContrato.tipoEmprestimo.id, 1, parametros.idTipoContrato, false, out msg);
                
                //William Moreira da Silva - SOL PPM
                if(!String.IsNullOrEmpty(msg))
                {
                    listaMensagens.Add(msg);
                }
                //William Moreira da Silva - SOL PPM

                //William Moreira da Silva - SOL 229282 PPM 384002
            }

            return contratos;

        }

        private Contrato consultarContrato(long numeroContrato)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                return cliente.contrato.consultarContrato(numeroContrato);
            }
        }

        private DadosBancarios consultarDadosBancarios(int idMutuario)
        {
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                List<DadosBancarios> listaContas = cliente.contrato.consultarContaBancaria(idMutuario, 0, 0);

                if (listaContas.Count == 1)
                    return listaContas[0];
                else if (listaContas.Count > 1)
                    return listaContas.Find(c => c.contraPreferencial == 1);
                else
                    return new DadosBancarios();
            }

        }

        // Felipe A. Santos -  SOL 258704/17636 PPM 1008709 - início
        private List<DadosBancarios> consultarDadosBancarios(string matricula)
        {
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                return cliente.contrato.consultarContaBancaria(matricula);

            }
        }
        // Felipe A. Santos -  SOL 258704/17636 PPM 1008709  - fim

        // Xavier SOL 209495
        private List<ContaCaixa> consultarPortadorForma()
        {
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                List<ContaCaixa> listaPortForma = cliente.contrato.listarContaCaixa();
                return listaPortForma;                
            }

        }
        // Xavier SOL 209495

        private Mutuario consultarMutuario(string matriculaMutuario)
        {
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                Mutuario mutuario = new Mutuario { matricula = matriculaMutuario };

                ParametrosConsulta parametros = new ParametrosConsulta();

                List<Mutuario> listaMutuario = cliente.contrato.consultarMutuario(mutuario, ref parametros);

                mutuario = new Mutuario();

                if (listaMutuario.Count > 0)
                {
                    mutuario = listaMutuario[0];
                }

                return mutuario;
            }

        }

        private TipoContrato consultarTipoContrato(int idTipoContrato, bool veioConector)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                return cliente.contrato.consultarTipoContrato(idTipoContrato, veioConector);
            }
        }

        private TipoSuspensao consultarTipoSuspensao(int idTipoSuspensao, int idTipoContrato)
        {

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                List<TipoSuspensao> tipos = cliente.contrato.consultarTipoSuspensao(idTipoContrato, idTipoSuspensao);

                if (tipos.Count > 0)
                {
                    return tipos[0];
                }
                else
                {
                    return new TipoSuspensao();
                }

            }

        }

        private bool verificarContratoPadrao(int idContratoPadrao)
        {
            bool retorno = false;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                retorno = cliente.contrato.validarContratoPadrao(idContratoPadrao);
            }

            return retorno;
        }

        private void incluirContratoPadrao(Parametros parametros)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                Assinatura assinatura = new Assinatura();

                assinatura.numeroComprovante = parametros.numeroContrato;
                assinatura.mutuario = mutuario;
                assinatura.dataAssinatura = parametros.dataAssinatura;
                assinatura.idContratoPadrao = parametros.idContratoPadrao;
                assinatura.observacao = "Assinatura via Auto-Empréstimo atráves do Conector Web.";

                //William Moreira da Silva - SOL 231675 PPM 376435
                try
                {
                    cliente.contrato.incluirAssinaturaPadrao(assinatura);
                }
                catch (Exception ex)
                {
                    throw new Exception("Não foi possível inserir assinatura de contrato.");
                }
                //William Moreira da Silva - SOL 231675 PPM 376435
            }

        }

        private int calcularMesesSuspensao(Parametros parametros, Concessao dadosConcessao)
        {
            try
            {   
                TipoSuspensao tipoSuspensao = this.consultarTipoSuspensao(parametros.idTipoSuspensao, parametros.idTipoContrato);

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    IDictionary<string, object> parametrosRegra = new Dictionary<string, object>();

                    parametrosRegra.Add("IDMUTUARIO_P", mutuario.id);
                    parametrosRegra.Add("IDCONTRATO_P", null);
                    parametrosRegra.Add("IDCONTRATOAQUITAR_P", null);
                    parametrosRegra.Add("DATACREDITO_P", dadosConcessao.dataCredito);
                    parametrosRegra.Add("IDTIPOCONTRATO_P", parametros.idTipoContrato);
                    parametrosRegra.Add("IDOPERACAO_P", TipoOperacao.concessao.chave);
                    parametrosRegra.Add("IDTIPOSUSPENSAO_P", parametros.idTipoSuspensao);
                    parametrosRegra.Add("EXCEPCIONAL_P", 0);
                    parametrosRegra.Add("NUMPARCELA_P", dadosConcessao.numeroParcelas);
                    parametrosRegra.Add("DATAINICIOANT_P", null);
                    parametrosRegra.Add("QTDMESES_P", null);
                    parametrosRegra.Add("FLGQUITA_P", Convert.ToInt32(dadosConcessao.contratosEmAberto));

                    //INICIO - NILTON - SOL 200645 - KINTANA 1938390 - 14/02/13 
                    try
                    {
                        int mesesRegra = (int)cliente.contrato.executarRegra(tipoSuspensao.regraSuspensao, parametrosRegra);
                        return mesesRegra;
                    }
                    catch (System.ServiceModel.FaultException)
                    {   
                         return 0;
                    }
                    //FINAL - NILTON - SOL 200645 - KINTANA 1938390 - 14/02/13 
                }
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("Erro ao calcular meses de suspensão. {0}", ex.Message));
            }


        }

        private bool verificarAssinatura(int idTitular, int idMutuario, int idTipoContrato, int? flgtrataassinat) // Thiago Melo SOL 204452 KTN 1976411        
        {
            try
            {
                using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                {
                    List<string> listaAvisos = new List<string>();
                    // Thiago Melo SOL 204452 KTN 1976411 
                    cliente.contrato.verificarAssinatura(idTitular, idMutuario, idTipoContrato, flgtrataassinat, out listaAvisos);
                    // Thiago Melo SOL 204452 KTN 1976411 
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        private long gravarConcessao(Parametros parametros, Concessao dadosConcessao, List<ItemContrato> itensContrato, List<Contrato> contratosAQuitar)
        {

            this.validarConcessao(parametros, dadosConcessao);

            //Obtém dados do contrato
            Contrato contrato = this.obterContrato(parametros, dadosConcessao);

            //Filtra somente itens de concessão
            itensContrato = itensContrato.FindAll(t1 => t1.tipoEvento.chave == TipoEvento.concessao.chave);

            //Obtém Itens de histórico de concessão
            List<Historico> itensHistorico = this.obterItensHistorico(parametros, dadosConcessao, itensContrato);

            //SIG 63057
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                //William Moreira da Silva - SOL 143476/16437 - incluido o paramentro do relatorio(null)
                return cliente.contrato.gravar(contrato, itensHistorico, itensContrato, contratosAQuitar.FindAll(c => c.quitar == true || c.quitacaoObrigatoria == 1), null, null);
            }

        }

        private Contrato obterContrato(Parametros parametros, Concessao dadosConcessao)
        {
            // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início
            //Seta dados bancarios do mutuário
            //mutuario.dadosBancarios = this.consultarDadosBancarios(mutuario.id);
            mutuario.dadosBancarios = new DadosBancarios() 
            {
                id = int.Parse(parametros.IdcontaBancaria) 
            };
            // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - fim

            double? valorParcelaSuspensa;
            DateTime? dataTerminoSuspensao = null;

            if (parametros.mesesSuspensao != null)
            {
                this.calcularSuspensao(parametros, dadosConcessao, out valorParcelaSuspensa, out dataTerminoSuspensao);
            }

            //string sportadorCredito = this.consultarPortadorForma().recPagamento; // Xavier SOL 209495

            Contrato contrato = new Contrato()
            {
                numero = parametros.numeroContrato == "" ? 0 : long.Parse(parametros.numeroContrato),//William Moreira da Silva - SOL 251082
                tipo = new TipoContrato()
                {
                    id = parametros.idTipoContrato
                },
                indexador = new Moeda()
                {
                    id = 7
                },
                mutuario = mutuario,
                patrocinadora = new Patrocinadora()
                {
                    id = mutuario.patrocinadora.id
                },
                plano = new PlanoPrevidenciario()
                {
                    id = mutuario.plano.id
                },
                beneficiario = new Beneficiario()
                {
                    id = mutuario.id
                },
                formaPagamento = "24",
                //portadorCredito = this.consultarPortadorForma().Where(c => c.recPagamento == "R").First().id.ToString(), // Xavier SOL 209495,
                //portadorDebito = this.consultarPortadorForma().Where(c => c.recPagamento == "P" && c.portFormaPagamento != null).First().id.ToString(), // Xavier SOL 209495,
                //WILLIAM MOREIRA DA SILVA - SOL 215312 KTN 2044216
                portadorCredito = this.consultarPortadorForma().Where(c => c.recPagamento == "P" && c.portFormaPagamento != null).First().id.ToString(),
                portadorDebito = this.consultarPortadorForma().Where(c => c.recPagamento == "R").First().id.ToString(),
                //WILLIAM MOREIRA DA SILVA - SOL 215312 KTN 2044216
                valorContrato = parametros.valorSolicitado,
                totalParcelas = dadosConcessao.numeroParcelas.Value,
                salarioBase = dadosConcessao.salarioBase,
                valorMargem = dadosConcessao.valorMargem,
                valorMaximo = dadosConcessao.valorMaximo.Value,
                valorParcela = dadosConcessao.valorPrestacao,
                dataCredito = dadosConcessao.dataCredito,
                dataAssinatura = dadosConcessao.dataAssinatura,
                dataPrimeiraParcela = dadosConcessao.dataPrimeiraParcela,
                taxaJuros = dadosConcessao.taxaJurosConcessao,// NILTON - 18/12/12
                situacao = new SituacaoContrato() { codigo = "A" },
                suspensao = new Suspensao() { tipo = new TipoSuspensao() { id = parametros.mesesSuspensao == null ? 0 : parametros.idTipoSuspensao } },
                dataInicioSuspensao = dataTerminoSuspensao == null ? null : dadosConcessao.dataPrimeiraParcela,
                dataFimSuspensao = dataTerminoSuspensao,
                usuario = new Usuario() { login = "CM_WEB_AUTO" },
                excepcional = false,
                internet = true,
                codigoAutoEmprestimo = parametros.codigoAutoEmprestimo,
                versao = String.Concat(Assembly.GetExecutingAssembly().GetName().Version.ToString(), "CW"),
                numProtocolo = dadosConcessao.numProtocolo // Xavier SOL 172525    
            };

            return contrato;
        }

        private List<Historico> obterItensHistorico(Parametros parametros, Concessao dadosConcessao, List<ItemContrato> itensContrato)
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
                    dataPrevista = dadosConcessao.dataCredito,
                    dataEfetiva = null,
                    dataAtualizacao = dadosConcessao.dataCredito.Value,
                    anoCompetencia = dadosConcessao.dataCredito.Value.Year,
                    mesCompetencia = dadosConcessao.dataCredito.Value.Month,
                    mesCobranca = dadosConcessao.dataCredito.Value.Month,
                    anoCobranca = dadosConcessao.dataCredito.Value.Year,
                    valorPrevisto = item.valor,
                    valorEfetivo = null,
                    saldoDevedor = dadosConcessao.valorSolicitado.Value,
                    taxaJuros = dadosConcessao.taxaJurosConcessao,//NILTON - 19/12/12
                    baixado = 0,
                    enviado = 0,
                    rubrica = item.rubrica,
                    pagarReceber = item.pagarReceber,
                    numeroParcelas = dadosConcessao.numeroParcelas.Value,
                    dataVencimento = dadosConcessao.dataCredito,
                    tipoDivergencia = 0,
                    dataInclusao = DateTime.Now,
                    usuarioInclusao = "CM_WEB_AUTO",
                    versao = String.Concat(Assembly.GetExecutingAssembly().GetName().Version.ToString(), "CW"),
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

        private long? consultarAutoEmprestimo(Parametros parametros)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                long? numeroContrato = cliente.contrato.consultarAutoEmprestimo(parametros.codigoAutoEmprestimo);

                if (numeroContrato == null)
                {
                    throw new Exception("Número do contrato não encontrado.");
                }
                else
                {
                    return numeroContrato;
                }
            }
        }

        //William Moreira da Silva - SOL 214635 KTN 2044698
        /// <summary>
        /// Verifica se a modalidade do contrato escolhido esta ativa ou não
        /// </summary>
        /// <param name="idTipoContrato">id do tipo do contrato selecionado</param>
        private void verificaSituacaoContrato(int idTipoContrato)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                if (!cliente.contrato.validaContratoAtivo(idTipoContrato))
                {
                    // string msg = string.Format("Modalidade inativa.");  //SOL 248114
                    string msg = string.Format("Concessões temporariamente indisponíveis. Tente novamente mais tarde."); //SOL 248114                                                
                    throw new Exception(msg);
                }
            }
        }
        //William Moreira da Silva - SOL 214635 KTN 2044698


        #endregion

        #region Validações

        private DateTime validarDataAssinatura(string dataAssinatura)
        {
            DateTime data;

            //Validar data Assinatura
            if (string.IsNullOrEmpty(dataAssinatura))
            {
                throw new Exception("Data de Assinatura obrigatória.");
            }
            else
            {
                try
                {
                    data = Convert.ToDateTime(dataAssinatura);
                }
                catch
                {
                    throw new Exception("Data de Assinatura inválida.");
                }
            }

            return data;

        }

        private int validarIDContratoPadrao(string idContratoPadrao)
        {
            int idContrato = 0;

            //Validar Tipo Contrato
            if (string.IsNullOrEmpty(idContratoPadrao))
            {
                throw new Exception("ID do Contrato Padrão obrigatório.");
            }
            else
            {
                if (!int.TryParse(idContratoPadrao, out idContrato))
                {
                    throw new Exception("ID do Contrato Padrão inválido.");
                }
                else
                {
                    if (!this.verificarContratoPadrao(idContrato))
                        throw new Exception("ID do Contrato Padrão não encontrado.");
                }
            }

            return idContrato;
        }

        private void validarNumeroComprovante(string numeroComprovante)
        {
            if (string.IsNullOrEmpty(numeroComprovante.Trim()))
                throw new Exception("Número do comprovante obrigatório");

        }

        private void validarChave(string chaveValor)
        {
            if (string.IsNullOrEmpty(chaveValor))
                throw new Exception("Chave de identificação obrigatória.");

            string chavePrivada = ConfigurationManager.AppSettings["conector.chavePrivada"];
            string guid = ConfigurationManager.AppSettings["conector.guid"];

            string chave = Criptografia.DecriptarRC2(chavePrivada, chaveValor);

            if (!string.Equals(guid, chave, StringComparison.CurrentCulture))
                throw new Exception("Chave de identificação inválida.");
        }

        private void validarMatricula(string matricula)
        {
            //Validar Matrícula
            if (string.IsNullOrEmpty(matricula))
            {
                throw new Exception("Matrícula obrigatória.");
            }
            else
            {
                mutuario = this.consultarMutuario(matricula);
                if (mutuario == null || string.IsNullOrEmpty(mutuario.matricula))
                    throw new Exception("Matrícula não disponível.");
            }

        }

        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início
        public void ValidarMatriculaCB(string matricula)
        {
            if (string.IsNullOrEmpty(matricula))
            {
                throw new Exception("Matrícula não informada.");
            }
        }
       
        public void ValidarContaBancaria(string ContaBancaria)
        {
            int idConta = 0;
            
            if (string.IsNullOrEmpty(ContaBancaria))
            {
                throw new Exception("Número da conta bancária inválida.");
            }
            else
            {
                if (!int.TryParse(ContaBancaria, out idConta))
                {
                    throw new Exception("Número da conta bancária inválida.");
                }
                else
                {
                    List<DadosBancarios> dado = this.consultarDadosBancarios(mutuario.matricula);
                    if (dado.Count(c => c.id == idConta) == 0)
                    {
                        throw new Exception("Número da conta bancária inválida.");
                    }
                }
            }
        }
        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - fim

        private int validarTipoContrato(string tipoContrato)
        {
            int idTipoContrato = 0;

            //Validar Tipo Contrato
            if (string.IsNullOrEmpty(tipoContrato))
            {
                throw new Exception("Tipo do Contrato obrigatório.");
            }
            else
            {
                if (!int.TryParse(tipoContrato, out idTipoContrato))
                {
                    throw new Exception("Tipo do Contrato inválido.");
                }
                else
                {
                    if (this.consultarTipoContrato(idTipoContrato, false) == null)
                        throw new Exception("Tipo do Contrato não encontrado.");
                }
            }

            return idTipoContrato;
        }

        private int validarTipoSuspensao(string tipoSuspensao, int idTipoContrato)
        {
            int idTipoSuspensao = 0;

            //Validar Tipo Contrato
            if (string.IsNullOrEmpty(tipoSuspensao))
            {
                throw new Exception("Tipo da suspensão obrigatória.");
            }
            else
            {
                if (!int.TryParse(tipoSuspensao, out idTipoSuspensao))
                {
                    throw new Exception("Tipo da suspensão inválida.");
                }
                else
                {
                    if (this.consultarTipoSuspensao(idTipoSuspensao, idTipoContrato) == null)
                        throw new Exception("Tipo da suspensão não encontrada.");
                }
            }

            return idTipoSuspensao;
        }

        private double validarValorSolicitado(string valorSolicitado)
        {
            double valor = 0d;

            //Validar Tipo Contrato
            if (string.IsNullOrEmpty(valorSolicitado))
            {
                throw new Exception("Valor solicitado obrigatório.");
            }
            else if (!double.TryParse(valorSolicitado, out valor))
            {
                throw new Exception("Valor solicitado inválido.");
            }

            return valor;

        }

        private int? validarPrazo(string prazo)
        {
            int valor = 0;

            //Validar Tipo Contrato
            if (!string.IsNullOrEmpty(prazo))
            {
                if (!int.TryParse(prazo, out valor))
                {
                    throw new Exception("Prazo inválido.");
                }

                return valor;
            }
            else
                return null;
        }

        private int? validarMesesSuspensao(string meses)
        {
            int numeroMeses = 0;

            //Validar Tipo Contrato
            if (!string.IsNullOrEmpty(meses))
            {
                if (!int.TryParse(meses, out numeroMeses))
                {
                    throw new Exception("Número de meses inválido.");
                }

                if (numeroMeses > 0)
                    return numeroMeses;
                else
                    return null;
            }
            else
                return null;
        }

        private long validarCodigoAutoEmprestimo(string cdAutoEmprestimo, TipoValidacao tipo)
        {
            long codigo = 0;

            //Validar Tipo Contrato
            if (string.IsNullOrEmpty(cdAutoEmprestimo))
            {
                throw new Exception("Código Auto Empréstimo obrigatório.");
            }
            else
            {
                if (!long.TryParse(cdAutoEmprestimo, out codigo))
                {
                    throw new Exception("Código Auto Empréstimo inválido.");
                }
            }

            return codigo;
        }

        private List<long> validarContratosAQuitar(string contratosAQuitar)
        {
            List<long> lista = new List<long>();

            long numeroContrato = 0;

            if (!string.IsNullOrEmpty(contratosAQuitar))
            {
                string[] strLista = contratosAQuitar.TrimEnd(';').Split(';');

                for (int i = 0; i < strLista.Length; i++)
                {
                    if (!long.TryParse(strLista[i], out numeroContrato))
                    {
                        throw new Exception(string.Format("Número {0} de contrato inválido.", strLista[i]));
                    }
                    else
                    {
                        // Saulo / FUNCEF
                        //Contrato contrato = this.consultarContrato(numeroContrato);
                        ObjetoContrato contrato = new ObjetoContrato(numeroContrato, true);

                        if (contrato.numero == 0)
                        {
                            throw new Exception(string.Format("Contrato {0} não encontrato.", numeroContrato));
                        }
                        else if (contrato.mutuario.id != mutuario.id)
                        {
                            throw new Exception(string.Format("Contrato {0} não pertence a matrícula {1}.", numeroContrato, mutuario.matricula));
                        }

                        lista.Add(long.Parse(strLista[i]));
                    }
                }
            }

            return lista;
        }

        private void validarParametros(ref Parametros parametros, TipoValidacao tipo)
        {
            this.validarChave(parametros.chave);

            switch (tipo)
            {
                case TipoValidacao.Concessao:
                case TipoValidacao.Simulacao:
                case TipoValidacao.Incluir:
                    this.validarMatricula(parametros.matricula);

                    // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início
                    if (tipo == TipoValidacao.Incluir)
                    {
                        this.ValidarContaBancaria(parametros.IdcontaBancaria);  
                    }
                    // Felipe A. Santos - SOL 258704/17636 PPM 1008709  - fim

                    parametros.idTipoContrato = this.validarTipoContrato(parametros.idTipoContratoIN);
                    parametros.idTipoSuspensao = this.validarTipoSuspensao(parametros.idTipoSuspensaoIN, parametros.idTipoContrato);
                    parametros.mesesSuspensao = this.validarMesesSuspensao(parametros.mesesSuspensaoIN);
                    parametros.prazo = this.validarPrazo(parametros.prazoIN);
                    break;
                case TipoValidacao.Validar:
                    parametros.codigoAutoEmprestimo = this.validarCodigoAutoEmprestimo(parametros.codigoAutoEmprestimoIN, tipo);
                    break;
                case TipoValidacao.Assinatura:
                    this.validarMatricula(parametros.matricula);
                    parametros.idContratoPadrao = this.validarIDContratoPadrao(parametros.idContratoPadraoIN);
                    this.validarNumeroComprovante(parametros.numeroContrato);
                    parametros.dataAssinatura = this.validarDataAssinatura(parametros.dataAssinaturaIN);
                    break;
                // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início
                case TipoValidacao.ContaBancaria:
                    this.ValidarMatriculaCB(parametros.matricula);
                    break;
                // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - fim
                default:
                    break;
            }

            if (tipo == TipoValidacao.Simulacao || tipo == TipoValidacao.Incluir)
            {
                parametros.valorSolicitado = this.validarValorSolicitado(parametros.valorSolicitadoIN);
            }

            if (tipo == TipoValidacao.Incluir)
            {
                parametros.codigoAutoEmprestimo = this.validarCodigoAutoEmprestimo(parametros.codigoAutoEmprestimoIN, tipo);
            }

            //William Moreira da Silva - SOL 251082
            if (parametros.numeroContrato == null)
                parametros.numeroContrato = "";
            //William Moreira da Silva - SOL 251082
        }

        #endregion

    }
}
