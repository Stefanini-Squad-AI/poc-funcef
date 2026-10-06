#region SOL 225402  / PPM 1192509
///
/// Autor:
/// William Santana
///
/// Data da Alteração:
/// 21/12/2015
///
/// Descrição da Alteração:
/// Ajustar as mensagens de erro e de exibição de texto da regra
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using System.Collections;
using FUNCEF.Planus.Componentes;
using FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que representa regras gerais do sistema.
    /// </summary>
    public class GerenciadorRegra
    {
        #region Atributos

        private IAcessoRegra acesso = FabricaObjetos.instancia.obterAcessoRegra();

        #endregion

        #region Verificação de amortização

        /// <summary>
        /// Verifica se existe bloqueio contábil.
        /// </summary>
        /// <param name="dataReferencia"></param>
        public bool verificarBloqueioContabil(DateTime dataReferencia)
        {
            if (acesso.consultarContabilidadeBloqueada(dataReferencia))
                throw new ExcecaoPlanus(String.Format("Contabilidade Bloqueada até '{0}'.", dataReferencia.ToString("dd/MM/yyyy")));

            DateTime? dataLimite = acesso.consultarDataLimiteBloqueio();
            if (dataLimite.HasValue)
            {
                if (dataReferencia <= dataLimite.Value)
                    throw new ExcecaoPlanus(String.Format("Contabilidade Bloqueada até '{0}'.", dataLimite.Value.ToString("dd/MM/yyyy")));
            }

            return true;
        }

        public bool verificarBloqueioContabilChaveMestre(DateTime dataReferencia)
        {
            if (acesso.consultarContabilidadeBloqueada(dataReferencia))
                return false;

            //William Moreira da Silva - SOL 207977
            //DateTime? dataLimite = acesso.consultarDataLimiteBloqueio();
            //if (dataLimite.HasValue)
            //{
            //    if (dataReferencia <= dataLimite.Value)
            //        return false;
            //}
            //William Moreira da Silva - SOL 207977

            return true;
        }


        /// <summary>
        /// Metodo que verifica se o periodo esta bloqueado
        /// </summary>
        /// <param name="dataReferencia">Data a ser verificada</param>
        /// <returns></returns>
        //207977
        public bool verificaPeriodoBloqueado(DateTime dataReferencia)
        {
            if (acesso.verificarPeriodo(dataReferencia) != 0)
            {
                return true;
            }

            if (acesso.consultarContabilidadeBloqueada(dataReferencia))
            {
                return true;
            }

            return false;
        }

        /// <summary>
        /// Verifica períodos.
        /// </summary>
        /// <param name="dataReferencia"></param>
        public bool verificarPeriodo(DateTime dataReferencia)
        {
            int retorno = acesso.verificarPeriodo(dataReferencia);

            if (retorno == 0)
                throw new ExcecaoPlanus(String.Format("A Data '{0}' não pertence a nenhum período cadastrado", dataReferencia.ToString("dd/MM/yyyy")));
            else if (retorno == 1)
                throw new ExcecaoPlanus("Período bloqueado na Contabilidade");
            else if (retorno == 2)
                throw new ExcecaoPlanus("Período já integrado. Não é possível fazer a movimentação");
            else if (retorno == 3)
                throw new ExcecaoPlanus(String.Format("A Data '{0}' pertence a mais de um período. Verifique.", dataReferencia.ToString("dd/MM/yyyy")));

            return true;
        }

        public bool verificarPeriodoChaveMestre(DateTime dataReferencia)
        {
            int retorno = acesso.verificarPeriodo(dataReferencia);

            if (retorno == 2)
                return false;

            return true;
        }

        #endregion

        #region Parametros do sistema

        /// <summary>
        /// Consulta parametros do sistema.
        /// </summary>
        /// <returns>Hora de encerramenteo do sistema.</returns>
        public ParametroSistema consultarParametroSistema()
        {
            return acesso.consultarParametroSistema();
        }

        #endregion

        /// <summary>
        /// Obtem parametros da regra.
        /// </summary>
        /// <param name="id">Identificador da regra.</param>
        public IDictionary<string, object> obterParametros(Regra regra)
        {
            if (string.IsNullOrEmpty(regra.tipoMecanismoRegra) || string.IsNullOrEmpty(regra.chaveRegra))
            {
                regra = acesso.obterPropriedades(regra.id);
            }

            Type type = Type.GetType(regra.tipoMecanismoRegra, true);
            RegraBase regraPadrao = Activator.CreateInstance(type) as RegraBase;
            regraPadrao.atribuirEntidade(regra);

            return regraPadrao.obterAssinaturaParametros();
        }

        /// <summary>
        /// Executa regra passando os parâmetros obtdos.
        /// </summary>
        /// <param name="id">Identificador da regra.</param>
        /// <param name="parametros">Parâmetros da regra.</param>
        public object executar(Regra regra, IDictionary<string, object> parametros)
        {
            try
            {
                if (string.IsNullOrEmpty(regra.tipoMecanismoRegra) || string.IsNullOrEmpty(regra.chaveRegra))
                {
                    regra = acesso.obterPropriedades(regra.id);
                }

                RegraBase regraPadrao = UtilidadesReflexao.obterInstancia<RegraBase>(regra.tipoMecanismoRegra);

                regraPadrao.atribuirEntidade(regra);

                IDictionary<string, object> parametrosRegra = regraPadrao.obterAssinaturaParametros();

                UtilidadesRegra.associarParametros(parametros, parametrosRegra);

                object valorRetorno = regraPadrao.executar(parametrosRegra);

                return valorRetorno;

            }
            catch (ExcecaoPlanus ex)
            {
                //string msg = string.Format("Erro ao executar regra {0}. {1}", regra.id, ex.Message); //William Santana - SOL 225402 PPM 1192509 
                string msg = string.Format("{0}", ex.Message); //William Santana - SOL 225402 PPM 1192509 
                throw new ExcecaoPlanus(msg);
            }
            //Início - William Santana - SOL 225402 PPM 1192509 
            catch (Exception ex)
            {
                string msg = string.Format("Erro ao executar regra {0}. {1}", regra.id, ex.Message); //William Santana - SOL 225402 PPM 1192509 
                throw new ExcecaoPlanus(msg);
            }
            //Término - William Santana - SOL 225402 PPM 1192509 
        }

        public object executarRetorno(Regra regra, IDictionary<string, object> parametros, ref string mensagem)
        {
            //Campanha Desconto - Transaction excluído. Deve continuar?
            //using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            //{
                try
                {
                    if (string.IsNullOrEmpty(regra.tipoMecanismoRegra) || string.IsNullOrEmpty(regra.chaveRegra))
                    {
                        regra = acesso.obterPropriedades(regra.id);
                    }

                    RegraBase regraPadrao = UtilidadesReflexao.obterInstancia<RegraBase>(regra.tipoMecanismoRegra);

                    regraPadrao.atribuirEntidade(regra);

                    IDictionary<string, object> parametrosRegra = regraPadrao.obterAssinaturaParametros();

                    UtilidadesRegra.associarParametros(parametros, parametrosRegra);

                    object valorRetorno = ((IRegraBase)regraPadrao).executarRetorno(parametros, ref mensagem);

                    //Completa a transação
                    //transacao.Complete();

                    return valorRetorno;
                }
                catch (ExcecaoPlanus ex)
                {
                    //string msg = string.Format("Erro ao executar regra {0}. {1}", regra.id, ex.Message); //William Santana - SOL 225402 PPM 1192509 
                    string msg = string.Format("{0}", ex.Message); //William Santana - SOL 225402 PPM 1192509 
                    throw new ExcecaoPlanus(msg);
                }
                //Início - William Santana - SOL 225402 PPM 1192509 
                catch (Exception ex)
                {
                    string msg = string.Format("Erro ao executar regra {0}. {1}", regra.id, ex.Message); //William Santana - SOL 225402 PPM 1192509 
                    throw new ExcecaoPlanus(msg);
                }
                //Término - William Santana - SOL 225402 PPM 1192509 

            //}

        }

    }
}