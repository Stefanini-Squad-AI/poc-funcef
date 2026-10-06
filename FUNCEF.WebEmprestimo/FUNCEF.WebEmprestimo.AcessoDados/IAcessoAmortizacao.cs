using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados das amortizações.
    /// </summary>
    public interface IAcessoAmortizacao : IObjetoAcesso
    {
        /// <summary>
		/// Verificar se existe uma amortização anterior em aberto do contrato.
		/// </summary>
		/// <param name="numeroContrato">Número do cotrato.</param>
		/// <param name="dataAmortizacao">Data da amortização.</param>
        bool verificarAmortizacaoAnterior(long numeroContrato, DateTime dataAmortizacao);

        /// <summary>
        /// Verifica se já existe uma amortização para o contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataAmortizacao">Data da amortização.</param>
        bool verificarAmortizacaoExistente(long numeroContrato, DateTime dataAmortizacao);

        //William Moreira da Silva - SOL 249745
        /// <summary>
        /// Consulta que verifica se o participante já tem uma amortização para o contrato que seria quitado na renovação de emprestimo
        /// </summary>
        /// <param name="numeroContrato">Numero de contrato a ser verificado</param>
        /// <param name="dataPrevista">A data prevista que a amortização foi lanaçada</param>
        /// <returns>Retorna flgEnvio -1 se não tiver amortização ou 1/0 se já foi enviado ou não</returns>
        int verificarAmortizacaoExistente(long numeroContrato, out DateTime dataPrevista);

        string ObterNossoNumeroPorCodDocumento(double codDocumento);

        bool VerificarDocumentoEmitido(double codDocumento);

        string ObterProximoNossoNumeroDoConvenioPorCodigoPortadorForma(int codPortForma);

        void AtualizarNossoNumero(string nossoNumero, int codPortForma);

        void AtualizarNossoNumero(double codDocumento, string nossoNumero);

        Boleto ObterBoletoPorCodDocumento(double codDocumento, int portForma, bool blDocumentoEmitido, int tipoMovimento);

        void AtualizarCampoEmisBloqParaS(double codDocumento);

        EmptmoDocFinanceiroDTO RetornarDocumentoEnviado(double idContratoEmptmo, int tipoMovimento, int numParcela, DateTime dataVencimento);

        DateTime ObterUltimoDiaUtilBoleto();

        DateTime ObterProximoDiaUtil(DateTime data);

    }
}
