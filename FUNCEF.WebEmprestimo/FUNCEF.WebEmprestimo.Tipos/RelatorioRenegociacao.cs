#region SIG 21529
///
/// Autor:
/// Darivaldo Alencar
///
/// Data da Alteração:
/// 18/04/2018
///
/// Descrição da Alteração:
/// Campos de exportação do relatório de renegociação
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
    class RelatorioRenegociacao
    {
        #region dados do mutuario
        [DataMember]
        public string mutuario_nome
        {
            get;
            set;
        }

        [DataMember]
        public string mutuario_cpf
        {
            get;
            set;
        }

        [DataMember]
        public string mutuario_matricula
        {
            get;
            set;
        }

        [DataMember]
        public string mutuario_patrocinadora
        {
            get;
            set;
        }

        [DataMember]
        public string mutuario_plano
        {
            get;
            set;
        }

        [DataMember]
        public string mutuario_situacao
        {
            get;
            set;
        }
        #endregion

        #region dados do contrato de empréstimo
        [DataMember]
        public Double emprestimo_contrato
        {
            get;
            set;
        }

        [DataMember]
        public string emprestimo_modalidade
        {
            get;
            set;
        }

        [DataMember]
        public Double emprestimo_taxajuros
        {
            get;
            set;
        }

        [DataMember]
        public string emprestimo_indicecorrecao
        {
            get;
            set;
        }

        [DataMember]
        public int emprestimo_prazo
        {
            get;
            set;
        }

        [DataMember]
        public DateTime emprestimo_datacredito
        {
            get;
            set;
        }
        #endregion

        #region itens em aberto
        [DataMember]
        public string emprestimo_mesano
        {
            get;
            set;
        }

        [DataMember]
        public string emprestimo_item
        {
            get;
            set;
        }

        [DataMember]
        public string emprestimo_parcela
        {
            get;
            set;
        }

        [DataMember]
        public DateTime emprestimo_datavencimento
        {
            get;
            set;
        }

        [DataMember]
        public Double emprestimo_valornominal
        {
            get;
            set;
        }

        [DataMember]
        public Double emprestimo_correcaomonetaria
        {
            get;
            set;
        }

        [DataMember]
        public Double emprestimo_multa
        {
            get;
            set;
        }

        [DataMember]
        public Double emprestimo_jurosmora
        {
            get;
            set;
        }

        [DataMember]
        public Double emprestimo_iof
        {
            get;
            set;
        }

        [DataMember]
        public Double emprestimo_totalencargos
        {
            get;
            set;
        }

        [DataMember]
        public Double emprestimo_valortotal
        {
            get;
            set;
        }
        #endregion
    }
}
