using System;
//using System.Collections.Generic;
//using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Reflection;

namespace FUNCEF.Planus.WebEmprestimo.Web.Componentes
{
    /// <summary>
    /// Representa uma classe base para tipos enumerados (enum) desta aplicacao.
    /// </summary>
    [Serializable, DataContract]
    public abstract class TipoEnumeradorBase
    {
        #region Propriedades

        /// <summary>
        /// Obtém ou atribui a chave identificadora do enumerador.
        /// </summary>
        [DataMember]
        public string chave
        {
            get;
            set;
        }

        /// <summary>
        /// Obtém ou atribui a descrição do enumerador.
        /// </summary>
        [DataMember]
        public string descricao
        {
            get;
            set;
        }

        #endregion

        #region Construtor

        protected TipoEnumeradorBase()
        {
        }

        #endregion

        #region Operadores

        public static bool operator ==(TipoEnumeradorBase obj, object obj2)
        {
            if (obj2 is string)
                return obj.Equals((string)obj2);
            else if (obj2 is TipoEnumeradorBase)
                return obj.Equals((TipoEnumeradorBase)obj2);
            else
                return false;
        }

        public static bool operator !=(TipoEnumeradorBase obj, object obj2)
        {
            if (obj2 is string)
                return !obj.Equals((string)obj2);
            else if (obj2 is TipoEnumeradorBase)
                return !obj.Equals((TipoEnumeradorBase)obj2);
            else
                return true;
        }

        public bool Equals(TipoEnumeradorBase obj)
        {
            if (obj == null)
                return false;
            else
                return this.chave == obj.chave;
        }

        public bool Equals(string chave)
        {
            return this.chave == chave;
        }

        public override bool Equals(object obj)
        {
            return base.Equals(obj);
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        #endregion

        #region Métodos públicos

        /// <summary>
        /// Obtém através da chave um item do enumerador definido no tipo T.
        /// </summary>
        /// <typeparam name="T">Enumerador do qual será escolhido um item</typeparam>
        /// <param name="chave">Chave do enumerador para filtro.</param>
        /// <returns>Item do enumerador definido no tipo T</returns>
        public static T obterItemPelaChave<T>(string chave) where T : TipoEnumeradorBase
        {
            Type tipo = typeof(T);
            T enumeradorRetorno = default(T);
            bool achou = false;

            FieldInfo[] campos = tipo.GetFields(BindingFlags.Public | BindingFlags.Static);
            foreach (FieldInfo campo in campos)
            {
                Type tipoFilho = campo.FieldType;
                T enumerador = default(T);

                try
                {
                    enumerador = (T)campo.GetValue(null);
                }
                catch { }

                PropertyInfo[] propriedades = tipoFilho.GetProperties(BindingFlags.Public | BindingFlags.Instance);

                foreach (PropertyInfo propriedade in propriedades)
                {
                    if (propriedade.Name == "chave")
                    {
                        object valor = propriedade.GetValue(enumerador, null);
                        try
                        {
                            string valorConvertido = (string)valor;
                            if (valorConvertido == chave)
                            {
                                enumeradorRetorno = enumerador;
                                achou = true;
                                break;
                            }
                        }
                        catch { }
                    }
                }

                if (achou)
                    break;
            }

            return enumeradorRetorno;
        }

        /// <summary>
        /// Valida se o enumerador criado apra o sistema é válido.
        /// </summary>
        /// <param name="enumerador">Enumerador.</param>
        /// <param name="nomeParametro">Nome do parâmetro que contém o enumerador a ser validado.</param>
        /// <param name="mensagem">Mensagem a ser arremessada caso o enumerador não seja válido.</param>
        public static void enumeradorValido(TipoEnumeradorBase enumerador, string nomeParametro, string mensagem)
        {
            if (enumerador == null)
            {
                throw new ArgumentException(mensagem, nomeParametro);
            }
        }

        #endregion
    }
}
