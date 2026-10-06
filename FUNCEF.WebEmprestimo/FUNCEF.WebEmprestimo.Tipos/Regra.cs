using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    //TODO: Colocar como classe abstrata depois de preparadas as regras.
    /// <summary>
    /// Classe que representa regras gerais do sistema.
    /// </summary>
    [DataContract]
    [Serializable]
    public class Regra
    {
        [DataMember]
        public int id
        {
            get;
            set;
        }

        public string chaveRegra
        {
            get;
            set;
        }

        public string tipoMecanismoRegra
        {
            get;
            set;
        }
    }
}