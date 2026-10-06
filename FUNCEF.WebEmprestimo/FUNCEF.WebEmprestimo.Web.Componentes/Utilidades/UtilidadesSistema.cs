using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Configuration;
using System.Globalization;
using System.Threading;
using Microsoft.Security.Application;
using System.Web.Configuration;
using System.Reflection;
using System.Web.UI.WebControls;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;




namespace FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades
{
    /// <summary>
    /// Possui uma série de utilidades de sistema.
    /// </summary>
    public static class UtilidadeSistema
    {
        #region Constantes

        /// <summary>
        /// Obtém o tamanho máximo padrão para textos.
        /// </summary>
        public const int tamanhoMaximoPadrao = 255;

        #endregion

        #region Codificação

        /// <summary>
        /// Codifica o texto para exibição em HTML.
        /// </summary>
        /// <param name="texto">Texto original.</param>
        /// <returns><see cref="System.String"/> codificada.</returns>
        public static string codificarHTML(string texto)
        {
            return AntiXss.HtmlEncode(texto);
        }

        /// <summary>
        /// Codifica o texto para exibição em JavaScript.
        /// </summary>
        /// <param name="texto">Texto original.</param>
        /// <returns><see cref="System.String"/> codificada.</returns>
        public static string codificarJavaScript(string texto)
        {
            return AntiXss.JavaScriptEncode(texto);
        }

        /// <summary>
        /// Codifica o texto para exibição em Url.
        /// </summary>
        /// <param name="texto">Texto original.</param>
        /// <returns><see cref="System.String"/> codificada.</returns>
        public static string codificarUrl(string texto)
        {
            return AntiXss.UrlEncode(texto);
        }

        /// <summary>
        /// Codifica o texto para exibição em atributos Html.
        /// </summary>
        /// <param name="texto">Texto original.</param>
        /// <returns><see cref="System.String"/> codificada.</returns>
        public static string codificarAtributoHtml(string texto)
        {
            return AntiXss.HtmlAttributeEncode(texto);
        }

        /// <summary>
        /// Decodifica o texto para exibicação em JavaScript.
        /// </summary>
        /// <param name="texto">Texto original.</param>
        /// <returns><see cref="System.String"/> decodificada.</returns>
        public static string decodificarJavaScript(string texto)
        {
            if (!String.IsNullOrEmpty(texto))
            {
                return texto.Trim().Replace("'", "\\'");
            }

            return String.Empty;
        }

        #endregion

        #region Conversão

        /// <summary>
        /// Assegura que a Thread possui a cultura correta,
        /// configurada para a aplicação.
        /// </summary>
        public static void assegurarCultura()
        {
            GlobalizationSection section = ConfigurationManager.GetSection("system.web/globalization") as GlobalizationSection;

            if (section != null)
            {
                if (!string.IsNullOrEmpty(section.Culture) && !section.Culture.Equals("auto", StringComparison.InvariantCultureIgnoreCase))
                {
                    Thread.CurrentThread.CurrentCulture = CultureInfo.GetCultureInfo(section.Culture);
                }

                if (!string.IsNullOrEmpty(section.UICulture) && !section.UICulture.Equals("auto", StringComparison.InvariantCultureIgnoreCase))
                {
                    Thread.CurrentThread.CurrentUICulture = CultureInfo.GetCultureInfo(section.UICulture);
                }
            }
        }



        #endregion

        /// <summary>
        /// Obtém o texto tratado, considerando-se seu tamanho máximo.
        /// </summary>
        /// <param name="texto">Texto original.</param>
        /// <param name="tamanhoMaximo">Tamanho máximo permitido.</param>
        /// <returns><see cref="System.String"/> com o texto tratado.</returns>
        public static string obterTexto(string texto, int tamanhoMaximo)
        {
            if (!String.IsNullOrEmpty(texto))
            {
                texto = texto.Trim();

                if (tamanhoMaximo == 0)
                    tamanhoMaximo = tamanhoMaximoPadrao;

                if (texto.Length > tamanhoMaximoPadrao)
                    texto = texto.Substring(0, tamanhoMaximo);

                return texto;
            }

            return String.Empty;
        }

        /// <summary>
        /// Formata o CPF no formato "999.999.999-99".
        /// </summary>
        /// <param name="cpf">CPF não formatado.</param>
        /// <returns><see cref="System.String"/> com o CPF formatado.</returns>
        public static string formatarCPF(string cpf)
        {
            if (!String.IsNullOrEmpty(cpf))
            {
                cpf = cpf.Trim().Replace(".", "").Replace("-", "");
                if (cpf.Length == 11)
                {
                    string cpfFormatado = cpf.Substring(0, 3);
                    cpfFormatado += ".";
                    cpfFormatado += cpf.Substring(3, 3);
                    cpfFormatado += ".";
                    cpfFormatado += cpf.Substring(6, 3);
                    cpfFormatado += "-";
                    cpfFormatado += cpf.Substring(9);

                    cpf = cpfFormatado;
                }

                return cpf;
            }

            return String.Empty;
        }

        /// <summary>
        /// Formata a Data caso não seja nula.
        /// </summary>
        /// <param name="data">Data não formatada.</param>
        /// <param name="formato">Formato que a Data deve obter.</param>
        /// <returns><see cref="null"/> com o valor nulo.</returns>
        /// <returns><see cref="data.Value"/> com a Data formatada.</returns>
        public static string obterString(this DateTime? data, string formato)
        {
            if (data.HasValue)
            {
                return data.Value.ToString(formato);
            }

            return null;
        }

        /// <summary>
        /// Formata a Data caso não seja nula.
        /// </summary>
        /// <param name="data">Data não formatada.</param>
        /// <returns><see cref="obterString"/> método para formatação</returns>
        public static string obterString(this DateTime? data)
        {
            return obterString(data, "dd/MM/yyyy");
        }

        public static void preencherDropDown<T>(DropDownList objeto, bool limpar, EnumeradorItemPreenchimento itemPreenchimento)
        {
            Type tipo = typeof(T);

            if (limpar)
                objeto.Items.Clear();

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

                PropertyInfo propriedadeChave = tipoFilho.GetProperty("chave", BindingFlags.Public | BindingFlags.Instance);
                PropertyInfo propriedadeDescricao = tipoFilho.GetProperty("descricao", BindingFlags.Public | BindingFlags.Instance);

                objeto.Items.Add(new ListItem(propriedadeDescricao.GetValue(enumerador, null).ToString(), propriedadeChave.GetValue(enumerador, null).ToString()));
            }

            UtilidadesPagina.tratarItemPreenchimento(objeto, itemPreenchimento);
        }

        public static string tratarConsultaLike(string conteudo, int instrucaoLike)
        {
            if (string.IsNullOrEmpty(conteudo))
                return conteudo;

            switch (instrucaoLike)
            {
                case 1:
                    return conteudo + "%";
                case 2:
                    return "%" + conteudo + "%";
                default:
                    return conteudo;
            }

        }

    }
}
