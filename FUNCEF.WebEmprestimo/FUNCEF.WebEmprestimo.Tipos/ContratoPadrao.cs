#region SIG 28915
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 12/12/2016 12:24:23
///
/// Descrição da Alteração:
/// Criação do arquivo
///
#endregion

using System;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    public class ContratoPadrao
    {
        public int IdContratoPadrao { get; set; }
        public int IdTipoContrEmptmo { get; set; }
        public string Descricao { get; set; }
        public bool Obrigatorio { get; set; }
        public DateTime DataInicio { get; set; }
        public DateTime DataInclusao { get; set; }
    }
}
