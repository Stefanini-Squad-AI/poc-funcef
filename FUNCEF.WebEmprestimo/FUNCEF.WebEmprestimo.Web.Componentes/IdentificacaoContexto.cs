using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Web.Componentes
{
    /// <summary>
    /// Contém uma série de constantes de identificação dos contextos de segurança da solução.
    /// </summary>
    public static class IdentificacaoContexto
    {
        /// <summary>
        /// 
        /// </summary>
        public const string amortizacao = "AMORT";

        /// <summary>
        /// 
        /// </summary>
        public const string quitacao = "QUIT";

        /// <summary>
        /// 
        /// </summary>
        public const string emprestimo = "EMPRE";

        /// <summary>
        /// 
        /// </summary>
        public const string contrato = "CONTR";

        /// <summary>
        /// 
        /// </summary>
        public const string alteracoesContratuais = "ACONT";

        /// <summary>
        /// 
        /// </summary>
        public const string lancamentoHistoricoSuspensaoContrato = "LHSUS";

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// 
        /// </summary>
        public const string tratamentoIndividualdeParcelas = "INDIV";

        //William Moreira da Silva - SOL 246823
        /// <summary>
        /// 
        /// </summary>
        public const string envio = "ENVIO";
        
        //William Santana - SOL 50871
        /// <summary>
        /// 
        /// </summary>
        public const string modelocontrato = "MCONT";
    }
}
