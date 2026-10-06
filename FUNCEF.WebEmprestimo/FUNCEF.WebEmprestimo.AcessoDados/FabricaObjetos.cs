using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Fábrica abstrata de objetos de acesso a dados para o modulo de sistema.
    /// </summary>
    public abstract class FabricaObjetos
    {
        #region Constantes

        private const string chaveTipoFabrica = "sistema.tipoFabricaAcessoDados";

        #endregion

        #region Atributos Estáticos

        private static readonly object objetoTrava = new object();

        #endregion

        #region Construtores Estáticos

        /// <summary>
        /// Inicializa a classe para chamadas estáticas.
        /// </summary>
        static FabricaObjetos()
        {
            if (FabricaObjetos.instancia == null)
            {
                lock (objetoTrava)
                {
                    if (FabricaObjetos.instancia == null)
                    {
                        Type tipoFabrica = Type.GetType(ConfigurationManager.AppSettings[chaveTipoFabrica], true);
                        FabricaObjetos.instancia = (FabricaObjetos)Activator.CreateInstance(tipoFabrica);
                    }
                }
            }
        }

        #endregion

        #region Propriedades Estáticas

        /// <summary>
        /// Obtém uma instância única desta classe.
        /// </summary>
        public static FabricaObjetos instancia
        {
            get;
            private set;
        }

        #endregion

        #region Métodos de Fábrica de Objetos de Acesso a Dados

        /// <summary>
        /// Obtém um novo objeto de acesso a dados do estado do sistema.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado.IAcessoEstado"/></returns>
        public abstract IAcessoEstado obterAcessoEstado();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de contratos.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoContrato"/></returns>
        public abstract IAcessoContrato obterAcessoContrato();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de beneficiários.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoContrato"/></returns>
        public abstract IAcessoBeneficiario obterAcessoBeneficiarios();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de amortização.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoAmortizacao"/></returns>
        public abstract IAcessoAmortizacao obterAcessoAmortizacao();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de quitação.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoQuitacao"/></returns>
        public abstract IAcessoQuitacao obterAcessoQuitacao();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de desconto.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoDesconto"/></returns>
        public abstract IAcessoDesconto obterAcessoDesconto();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de inadimplência.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoDesconto"/></returns>
        public abstract IAcessoInadimplencia obterAcessoInadimplencia();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de regra.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoRegra"/></returns>
        public abstract IAcessoRegra obterAcessoRegra();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de tipo de contrato.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoTipoContrato"/></returns>
        public abstract IAcessoTipoContrato obterAcessoTipoContrato();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de mutuário.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoMutuario"/></returns>
        public abstract IAcessoMutuario obterAcessoMutuario();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de histórico.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoHistorico"/></returns>
        public abstract IAcessoHistorico obterAcessoHistorico();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de moeda.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoMoeda"/></returns>
        public abstract IAcessoMoeda obterAcessoMoeda();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados da concessão.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoConcessao"/></returns>
        public abstract IAcessoConcessao obterAcessoConcessao();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de tipo de suspensão.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoTipoSuspensao"/></returns>
        public abstract IAcessoTipoSuspensao obterAcessoTipoSuspensao();

        /// <summary>
        /// Obtém um novo objeto de acesso a dados de histórico de suspensão.
        /// </summary>
        /// <returns>Objeto <see cref="FUNCEF.Planus.WebEmprestimo.AcessoDados.IAcessoHistoricoSuspensao"/></returns>
        public abstract IAcessoHistoricoSuspensao obterAcessoHistoricoSuspensao();

        #endregion
    }
}
