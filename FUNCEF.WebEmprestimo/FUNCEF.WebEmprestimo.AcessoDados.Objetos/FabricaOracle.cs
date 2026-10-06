using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos.Estado;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos
{
    /// <summary>
    /// Fábrica de acesso a dados no Oracle usando Oracle.ManagedDataAccess.
    /// </summary>
    public sealed class FabricaOracle : FabricaObjetos
    {
        /// <summary>
        /// Obtém um novo objeto de acesso a dados do estado do sistema.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado.IAcessoEstado"/></returns>
        public override IAcessoEstado obterAcessoEstado()
        {
            return new AcessoEstado();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados dde contratos.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoContrato"/></returns>
        public override IAcessoContrato obterAcessoContrato()
        {
            return new AcessoContrato();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de beneficiários.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoContrato"/></returns>
        public override IAcessoBeneficiario obterAcessoBeneficiarios()
        {
            return new AcessoBeneficiario();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de amortização.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoAmortizacao"/></returns>
        public override IAcessoAmortizacao obterAcessoAmortizacao()
        {
            return new AcessoAmortizacao();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de quitação.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoQuitacao"/></returns>
        public override IAcessoQuitacao obterAcessoQuitacao()
        {
            return new AcessoQuitacao();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de desconto.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoDesconto"/></returns>
        public override IAcessoDesconto obterAcessoDesconto()
        {
            return new AcessoDesconto();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de inadimplência.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoInadimplencia"/></returns>
        public override IAcessoInadimplencia obterAcessoInadimplencia()
        {
            return new AcessoInadimplencia();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de regra.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoRegra"/></returns>
        public override IAcessoRegra obterAcessoRegra()
        {
            return new AcessoRegra();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de tipo de contrato.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoTipoContrato"/></returns>
        public override IAcessoTipoContrato obterAcessoTipoContrato()
        {
            return new AcessoTipoContrato();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de mutuario.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoMutuario"/></returns>
        public override IAcessoMutuario obterAcessoMutuario()
        {
            return new AcessoMutuario();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de histórico.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoHistorico"/></returns>
        public override IAcessoHistorico obterAcessoHistorico()
        {
            return new AcessoHistorico();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de Moeda.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoHistorico"/></returns>
        public override IAcessoMoeda obterAcessoMoeda()
        {
            return new AcessoMoeda();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de Concessão.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoConcessao"/></returns>
        public override IAcessoConcessao obterAcessoConcessao()
        {
            return new AcessoConcessao();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de tipo de suspensão.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoTipoSuspensao"/></returns>
        public override IAcessoTipoSuspensao obterAcessoTipoSuspensao()
        {
            return new AcessoTipoSuspensao();
        }

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de histórico de suspensao.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoHistoricoSuspensao"/></returns>
        public override IAcessoHistoricoSuspensao obterAcessoHistoricoSuspensao()
        {
            return new AcessoHistoricoSuspensao();
        }
    }
}
