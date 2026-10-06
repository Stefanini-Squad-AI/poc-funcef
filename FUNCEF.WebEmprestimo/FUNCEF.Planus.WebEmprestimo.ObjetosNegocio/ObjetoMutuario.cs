using System;
using System.Configuration;
using System.Collections.Generic;
using System.Runtime.Serialization;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using FUNCEF.Planus.WebEmprestimo.Servicos;

namespace FUNCEF.Planus.WebEmprestimo.ObjetosNegocio
{
    /// <summary>
    /// Classe que representa um mutuário, trabalha de forma otimizada com o banco de dados, através do conceito lazyload,
    /// com o intuito de evitar alta carga gerada pela consulta de todos os dados do mutuário de uma única vez.
    /// </summary>
    /// <param name=""></param>

    //Objeto ainda não implementado

    [DataContract]
    [Serializable]
    public class ObjetoMutuario : Mutuario
    {
    }
}
