using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados de histórico de suspensão.
    /// </summary>
    public interface IAcessoHistoricoSuspensao : IObjetoAcesso
    {
        /// <summary>
        /// Verifica a existencia de uma suspensão ativa.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        bool verificarSuspensaoAtiva(long numeroContrato);

        /// <summary>
        /// Verifica se teve suspensão no periodo cadastrado
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        bool verificaSuspensaoPeriodo(long numeroContrato, DateTime dataIni, DateTime dataFim);//William Moreira da Silva SOL161447

        /// <summary>
        /// Verifica se algum tem contrato ativo
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        bool verificaContratoAtivo(long numeroContrato);//William Moreira da Silva SOL161201

        /// <summary>
        /// Inclui historico de suspensão de um contrato.
        /// </summary>
        /// <param name="historioSuspensao">Dados da suspensão.</param>
        void incluir(HistoricoSuspensao historico);

        /// <summary>
        /// Alterar registro no histórico de suspensão passando o histórico de suspensão.
        /// </summary>
        /// <param name="historico">Dados da suspensão</param>
        void alterar(HistoricoSuspensao historico);

        int BuscarQtdParcelasSuspensas(long NumeroContrato);
    }
}
