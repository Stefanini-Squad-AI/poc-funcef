using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que gerencia Amortização.
    /// </summary>
    public class GerenciadorAmortizacao
    {
        #region Atributos

        private IAcessoAmortizacao acesso = FabricaObjetos.instancia.obterAcessoAmortizacao();

        #endregion

        /// <summary>
        /// Valida a amortização.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataAmortizacao">Data da amortização.</param>
        /// <param name="dataCredito">Data de crédito do contrato.</param>
        /// <param name="dataLimite">Data limite para amortização.</param>
        /// <param name="excepcional">Indica se é uma amortização excepcional ou não.</param>
        /// <returns></returns>
        public bool validar(long numeroContrato, DateTime dataAmortizacao, DateTime dataCredito, DateTime dataLimite, bool excepcional)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                // Zera a hora das datas
                dataAmortizacao = new DateTime(dataAmortizacao.Year, dataAmortizacao.Month, dataAmortizacao.Day);
                dataCredito = new DateTime(dataCredito.Year, dataCredito.Month, dataCredito.Day);
                dataLimite = new DateTime(dataLimite.Year, dataLimite.Month, dataLimite.Day);

                this.validarDatas(dataAmortizacao, dataCredito, dataLimite, excepcional);
                this.verificarAmortizacaoAnterior(numeroContrato, dataAmortizacao);
                this.verificarAmortizacaoExistente(numeroContrato, dataAmortizacao);

                GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
                if (!gerenciadorContrato.verificarAtualizacaoSaldo(numeroContrato, dataAmortizacao, TipoEvento.amortizacao))
                    throw new ExcecaoPlanus("Há mais de uma atualização do Saldo Devedor posterior à Data de Amortização.");

                GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
                gerenciadorRegra.verificarBloqueioContabil(dataAmortizacao);
                gerenciadorRegra.verificarPeriodo(dataAmortizacao);

                if (!excepcional)
                {
                    if (gerenciadorContrato.parcelaAtrasadaEmAberto(numeroContrato, dataAmortizacao))
                        throw new ExcecaoPlanus("Existe(m) parcela(s) anterior(es) em aberto.");
                }

                if (!gerenciadorContrato.verificarAtualizacaoDiaria(numeroContrato, dataAmortizacao))
                    throw new ExcecaoPlanus("Não existe atualização diária para esse contrato.");

                GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();
                if (gerenciadorQuitacao.verificarQuitacaoLancada(numeroContrato))
                    throw new ExcecaoPlanus("Já existe uma quitação lançada.");

                transacao.Complete();

                return true;
            }
        }

        /// <summary>
        /// Valida datas para amortização.
        /// </summary>
        /// <param name="dataAmortizacao">Data da amortização.</param>
        /// <param name="dataCredito">Data de cédito do contrato a ser amortizado.</param>
        /// <param name="dataLimite">Data limite calculada para amortização do contrato.</param>
        /// <param name="excepcional">Define se é uma amortização excepcional.</param>
        public bool validarDatas(DateTime dataAmortizacao, DateTime dataCredito, DateTime dataLimite, bool excepcional)
        {
            if (dataAmortizacao <= dataCredito)
                throw new ExcecaoPlanus("Data de Amortização deve ser maior que Data de Crédito.");
            else
            {
                if (!excepcional)
                {
                    DateTime dataAtual = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);

                    if (dataAmortizacao < dataAtual)
                        throw new ExcecaoPlanus("Data de Amortização não pode ser menor que Data Atual.");

                    if (dataAmortizacao < dataLimite)
                        throw new ExcecaoPlanus(String.Format("Data de Amortização não pode ser menor que Data Limite({0}).", dataLimite.ToString("dd/MM/yyyy")));
                }
            }

            return true;
        }

        //William Moreira da Silva - SOL 249745
        /// <summary>
        /// Consulta que verifica se o participante já tem uma amortização para o contrato que seria quitado na renovação de emprestimo
        /// </summary>
        /// <param name="numeroContrato">Numero de contrato a ser verificado</param>
        /// <param name="dataPrevista">A data prevista que a amortização foi lanaçada</param>
        /// <returns>Retorna flgEnvio -1 se não tiver amortização ou 1/0 se já foi enviado ou não</returns>
        public int verificarAmortizacaoExistente(long numeroContrato, out DateTime dataPrevista)
        {
            return acesso.verificarAmortizacaoExistente(numeroContrato, out dataPrevista);
        }

        /// <summary>
        /// Verificar se existe uma amortização anterior em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataAmortizacao">Data da amortização.</param>
        public bool verificarAmortizacaoAnterior(long numeroContrato, DateTime dataAmortizacao)
        {
            bool existeAmortizacaoAnterior = acesso.verificarAmortizacaoAnterior(numeroContrato, dataAmortizacao);

            if (existeAmortizacaoAnterior)
                throw new ExcecaoPlanus(String.Format("Existe amortização anterior em aberto na data '{0}'.", dataAmortizacao.ToString("dd/MM/yyyy")));
            else
                return true;
        }

        /// <summary>
        /// Verifica se já existe uma amortização para o contrato.
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <param name="dataAmortizacao"></param>
        public bool verificarAmortizacaoExistente(long numeroContrato, DateTime dataAmortizacao)
        {
            bool existeAmortizacao = acesso.verificarAmortizacaoExistente(numeroContrato, dataAmortizacao);

            if (existeAmortizacao)
                throw new ExcecaoPlanus(String.Format("Já existe uma amortização na data '{0}'.", dataAmortizacao.ToString("dd/MM/yyyy")));
            else
                return true;
        }

        /// <summary>
        /// Aplica tratamento nas informações de histórico de amortização do contrato.
        /// </summary>
        /// <param name="historico"></param>
        public List<Historico> tratarHistorico(List<Historico> historico)
        {
            foreach (Historico item in historico)
            {
                if (item.valorPrevisto == 0 && (item.centraliza == 1 || item.destacado == 1))
                {
                    item.dataEfetiva = item.dataPrevista;
                    item.valorEfetivo = 0;
                    item.baixado = null;
                }
                else
                {
                    item.dataEfetiva = null;
                    item.valorEfetivo = null;
                    item.baixado = 0;
                }
            }

            return historico;
        }

        //Campanha Desconto
        public string ObterNossoNumeroPorCodDocumento(double codDocumento)
        {
            return acesso.ObterNossoNumeroPorCodDocumento(codDocumento);
        }

        public bool VerificarDocumentoEmitido(double codDocumento)
        {
            return acesso.VerificarDocumentoEmitido(codDocumento);
        }

        public string ObterProximoNossoNumeroDoConvenioPorCodigoPortadorForma(int codPortForma)
        {
            return acesso.ObterProximoNossoNumeroDoConvenioPorCodigoPortadorForma(codPortForma);
        }

        public void AtualizarNossoNumero(string nossoNumero, int codPortForma)
        {
            acesso.AtualizarNossoNumero(nossoNumero, codPortForma);
        }
        public void AtualizarNossoNumero(double codDocumento, string nossoNumero)
        {
            acesso.AtualizarNossoNumero(codDocumento, nossoNumero);
        }
        public Boleto ObterBoletoPorCodDocumento(double codDocumento, int portForma, bool blDocumentoEmitido, int tipoMovimento)
        {
            return acesso.ObterBoletoPorCodDocumento(codDocumento, portForma, blDocumentoEmitido, tipoMovimento);
        }
        public void AtualizarCampoEmisBloqParaS(double codDocumento)
        {
            acesso.AtualizarCampoEmisBloqParaS(codDocumento);
        }

        public EmptmoDocFinanceiroDTO RetornarDocumentoEnviado(double idContratoEmptmo, int tipoMovimento, int numParcela, DateTime dataVencimento)
        {
            return acesso.RetornarDocumentoEnviado(idContratoEmptmo, tipoMovimento, numParcela, dataVencimento);
        }

        public DateTime ObterUltimoDiaUtilBoleto()
        {
            return acesso.ObterUltimoDiaUtilBoleto();
        }

        public DateTime ObterProximoDiaUtil(DateTime data)
        {
            return acesso.ObterProximoDiaUtil(data);
        }


    }
}