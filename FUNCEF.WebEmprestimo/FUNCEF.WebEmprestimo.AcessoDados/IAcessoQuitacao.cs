using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados das quitações.
    /// </summary>
    public interface IAcessoQuitacao : IObjetoAcesso
    {
        /// <summary>
        /// Verifica se existe quitação lançada para o contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        bool verificarQuitacaoLancada(long numeroContrato);

        // SOL 201048
        /// <summary>
        /// Verifica se existe quitação.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        bool existeQuitacao(long numeroContrato);
        // SOL 201048

        // SOL 201048
        /// <summary>
        /// Verifica menor data vencimento.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        DateTime dataMinVencto(long numeroContrato);
        // SOL 201048

        //BRUNO AZEVEDO
        /// <summary>
        /// PROCEDIMENTO QUE CARREGA TODOS OS ITENS DO CONTRATO PASSADO
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        string carregaHistoricosQuitar(long numeroContrato);
        //BRUNO AZEVEDO

        /// <summary>
        /// Quitar itens em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="usuarioLogado">Usuário logado.</param>                                    
        /// <param name="usuarioLogado">Lista de históricos que deverão ser quitados.</param>                                    
        void quitarItensEmAberto(long numeroContrato, DateTime dataQuitacao, string usuarioLogado, List<string> historicosQuitacao); // Thiago Melo SOL 218914 Kintana 2050631

        /// <summary>
        /// Realiza a quitação dos itens em aberto através de stored procedure
        /// </summary>
        /// <param name="numeroContrato">Número do contrato</param>
        /// <param name="dataQuitacao">Data da quitação</param>
        /// <param name="operacao">Código da operação da quitação (antecipada, falecimento, novação, etc)</param>
        /// <param name="idCalculo">Identificador do cálculo da quitação</param>
        /// <returns></returns>
        bool quitarItensEmAberto_Procedure(long numeroContrato, DateTime dataQuitacao, int operacao, int? idCalculo, out string msgErro);

        /// <summary>
        /// Estorna itens a vencer.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="usuarioLogado">Usuário logado.</param>
        void estornarItensAVencer(long numeroContrato, DateTime dataQuitacao, string usuarioLogado);

        /// <summary>
        /// Estorna Itens a Vencer Atualização diária.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="usuarioLogado">Usuário logado.</param>
        void estornarItensAtualizacao(long numeroContrato, DateTime dataQuitacao, string usuarioLogado);

        //Campanha Desconto
        InformacoesQuitacao CalcularQuitacaoCampanhaDescontos(long numeroContrato, DateTime dataQuitacao, long idCalculo = 0, int tipoProposta = 0);
    }
}
