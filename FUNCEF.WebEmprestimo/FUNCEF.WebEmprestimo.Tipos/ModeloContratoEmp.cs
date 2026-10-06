#region SIG 50871
/// Autor:  
/// William Santana
///
/// Data da Atualização:
/// 03/08/2017
///
/// Criação de fucionalidade para importar modelos de contratos de empréstimo.
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [DataContract]
    [Serializable]
    public class ModeloContratoEmp
    {
        [DataMember]
        public Int32 idtbEmpContrato { get; set; }

        [DataMember]
        public Int32 idTipoContratoEmptmo { get; set; }

        [DataMember]
        public string tipoContrEmptmo { get; set; }

        [DataMember]
        public string link { get; set; }

        [DataMember]
        public string usuarioInclusao { get; set; }

        [DataMember]
        public DateTime dataInclusao { get; set; }

        [DataMember]
        public DateTime? DataInicioVigencia { get; set; }

        [DataMember]
        public DateTime? DataFimVigencia { get; set; }

        [DataMember]
        public int IdUsuario { get; set; }

        [DataMember]
        public int IdMinutaHistorico { get; set; }

        [DataMember]
        public int NuVersaoMinuta { get; set; }
    }
}
