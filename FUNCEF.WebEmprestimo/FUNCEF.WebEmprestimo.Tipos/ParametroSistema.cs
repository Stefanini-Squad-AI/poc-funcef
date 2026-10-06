using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    /// <summary>
    /// Classe que representa parametros do sistema
    /// </summary>
    [DataContract]
    [Serializable]
    public class ParametroSistema
    {
        [DataMember]
        public int? idRegraTipoContrato
        {
            get;
            set;
        }

        [DataMember]
        public string horaEncerramento
        {
            get;
            set;
        }

        [DataMember]
        public int? excepcional
        {
            get;
            set;
        }
        // Thiago Melo SOL 204452 KTN 1976411 INI
        [DataMember]
        public int? flgtrataassinat
        {
            get;
            set;
        }

        [DataMember]
        public string horaEncerramentoDebito
        {
            get;
            set;
        }
        // Thiago Melo SOL 204452 KTN 1976411

    }
}
