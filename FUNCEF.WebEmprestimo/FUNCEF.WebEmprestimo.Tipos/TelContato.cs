using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    //William Moreira da Silva SOL - 199759
    //Classe para fazer a integração entre o telefone e o contato
    [DataContract]
    [Serializable]
    public class TelContato
    {
        public int id { get; set; }
        public int? idTelefone { get; set; }
        public int? idContato { get; set; }
    }
}
