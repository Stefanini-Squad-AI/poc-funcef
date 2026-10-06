using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Possui uma série de constantes referentes ao módulo de sistema.
    /// </summary>
    public static class Constantes
    {
        #region Segurança

        /// <summary>
        /// Obtém a posição do dado 'Login' no array de dados de segurança.
        /// </summary>
        public static readonly int posicaoLogin = 0;

        /// <summary>
        /// Obtém a posição do dado 'Nome Completo' no array de dados de segurança.
        /// </summary>
        public static readonly int posicaoNomeCompleto = 1;

        /// <summary>
        /// Obtém a posição do dado 'Permissões' no array de dados de segurança.
        /// </summary>
        public static readonly int posicaoPermissoes = 2;

        /// <summary>
        /// Obtém a posição do dado 'IdUsuario' no array de dados de segurança.
        /// </summary>
        public static readonly int idUsuario = 3;

        #endregion

        #region Log

        #region Tipo de Acesso

        /// <summary>
        /// Obtém o código de tipo de acesso para Login com sucesso.
        /// </summary>
        public static readonly string loginSucesso = "LSUC";

        /// <summary>
        /// Obtém o código de tipo de acesso para "usuário inexistente no sistema".
        /// </summary>
        public static readonly string usuarioInexistente = "LFUN";

        /// <summary>
        /// Obtém o código de tipo de acesso para "usuário ou senha incorretos".
        /// </summary>
        public static readonly string falhaAutenticacao = "LFSB";

        /// <summary>
        /// Obtém o código de tipo de acesso para "usuário bloqueado".
        /// </summary>
        public static readonly string falhaBloqueado = "LFBL";

        #endregion

        #endregion

        #region Tamanho de campos

        /// <summary>
        /// Obtém o tamanho máximo do campo de Login no AD.
        /// </summary>
        public static readonly int tamanhoCampoLogin = 40;

        #endregion
    }
}
