#region SOL 225057/18141 / PPM 1315874
///
/// Autor:
/// Jessica Y. Oshiro
///
/// Data da Alteração:
/// 27/04/2016 09:21:53
///
/// Descrição da Alteração:
/// Adição do método consultarRegraFGQC
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados dos tipos de contrato.
    /// </summary>
    public interface IAcessoTipoContrato : IObjetoAcesso
    {
        /// <summary>
        /// Retorna dados de um tipo de contrato.
        /// </summary>
        /// <param name="id">Identificador do tipo de contrato</param>
        TipoContrato consultar(int id, bool veioConector);//Xavier SOL 230843

        /// Jessica Y. Oshiro - SOL 225057/18141 PPM 1315874 - incluído o campo IDREGRACALC - Inicio
        /// <summary>
        /// Retorna Regra FGQC.
        /// </summary>
        /// <param name="tipoContrato">Identificador do tipo de contrato</param>
        /// <param name="tipoEvento">Tipo de evento.</param>
        Int32 consultarRegraFGQC(TipoContrato tipoContrato, TipoEvento tipoEvento);//Xavier SOL 230843
        /// Jessica Y. Oshiro - SOL 225057/18141 PPM 1315874 - incluído o campo IDREGRACALC - Fim

        /// <summary>
        /// Retorna Itens de cálculo do tipo do contrato e tipo de evento.
        /// </summary>
        /// <param name="tipoContrato">Identificador do tipo de contrato</param>
        /// <param name="tipoEvento">Tipo de evento.</param>
        List<ItemContrato> obterItens(TipoContrato tipoContrato, TipoEvento tipoEvento);

        /// <summary>
        /// Lista os Tipos de Contrato do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoContrato"/> com o(s) tipo(s) de contratos(s) encontrado(s).</returns>
        List<TipoContrato> listar();

        // SOL 204001
        /// <summary>
        /// valida a permissao dos Tipos de Contrato do sistema.
        /// </summary>
        /// <returns> verdadeiro se existir a permissao para o tipo de contrato.</returns>
        bool validarPermissao(long idTipoContrato);
        // SOL 204001

        //William Moreira da Silva - SOL 207977 PPM
        /// <summary>
        /// Buscar os itens que serão calculados
        /// </summary>
        /// <param name="contrato">Número do contrato</param>
        /// <param name="parcela">Número da Parcela do Item</param>
        /// <returns>Retorna lista dos itens, e suas respectivas regras</returns>
        List<ItemContrato> obterItensContrato(int idTipoContrato, int parcela);

        int consultarTipoContratoQuitacao(int idTipoContrato, int tipoContratoAQuitar);

        /// <summary>
        /// Valida se o contrato esta ativo
        /// </summary>
        /// <param name="idTipoContrato">id do tipo do contrato</param>
        /// <returns>Retorna se esta ativo ou não</returns>
        //William Moreira da Silva - SOL 214635 KTN 2044698
        bool validaContratoAtivo(int idTipoContrato);

        TipoContrato ObterTipoContrato(long NumeroContrato);

        List<TipoContrato> ListarTodas();

        //SIG 128871 - Inclsuão da linha abaixo
        Int32 consultarRegraDescFGQC(TipoContrato tipoContrato, TipoEvento tipoEvento);
    }
}
