using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    [Serializable, DataContract]
    public class Origem : TipoEnumeradorBase<int>
    {
        #region Construtor

        private Origem()
        {
        }

        #endregion

        #region Membros
        // Thiago Melo SOL SOL207152
        //public static readonly Origem concessao = new Origem() { chave = 0, descricao = "Concessão" };        
        public static readonly Origem concessao = new Origem() { chave = 0, descricao = "Concessão/Renovação" };        
        // Thiago Melo SOL SOL207152
        public static readonly Origem parcelas = new Origem() { chave = 1, descricao = "Geração de Parcelas" };
        public static readonly Origem amortizacao = new Origem() { chave = 2, descricao = "Amortização/Refinanciamento" };
        public static readonly Origem quitacao = new Origem() { chave = 3, descricao = "Quitação Antecipada" };
        public static readonly Origem divergencias = new Origem() { chave = 4, descricao = "Tratamento de Divergências" };
        public static readonly Origem atualizacaoSaldo = new Origem() { chave = 5, descricao = "Atualização de Saldo (Diária)" };
        public static readonly Origem recalculo = new Origem() { chave = 6, descricao = "Recálculo Diário" };
        public static readonly Origem individual = new Origem() { chave = 7, descricao = "Tratamento Individual" };
        public static readonly Origem quitacaoMorte = new Origem() { chave = 8, descricao = "Quitação por Morte/Invalidez" };
        public static readonly Origem importacao = new Origem() { chave = 9, descricao = "Importação/Migração" };
        public static readonly Origem quitacaoResgate = new Origem() { chave = 10, descricao = "Quitação por Resgate" };
        public static readonly Origem recebimento = new Origem() { chave = 11, descricao = "Recebimento" };
        public static readonly Origem entradaManual = new Origem() { chave = 12, descricao = "Entrada Manual" };
        public static readonly Origem alteracaoConcesao = new Origem() { chave = 13, descricao = "Alteração de Concessão" };
        public static readonly Origem tratamentoValores = new Origem() { chave = 14, descricao = "Tratamento de Valores Não Programados" };
        public static readonly Origem consultaContratos = new Origem() { chave = 15, descricao = "Consulta de Contratos" };
        public static readonly Origem cancelamentoConcessao = new Origem() { chave = 16, descricao = "Cancelamento de Concessão" };
        public static readonly Origem alteracaoContratual = new Origem() { chave = 17, descricao = "Alteração Contratual" };
        public static readonly Origem liberacaoConcessao = new Origem() { chave = 18, descricao = "Liberação de Concessão" };
        public static readonly Origem envio = new Origem() { chave = 19, descricao = "Envio" };
        public static readonly Origem loteConcessao = new Origem() { chave = 41, descricao = "Contabilização em Lote de Concessão" };
        public static readonly Origem lotePrestacao = new Origem() { chave = 42, descricao = "Contabilização em Lote de Prestação" };
        public static readonly Origem loteAmortizacao = new Origem() { chave = 43, descricao = "Contabilização em Lote de Amortização" };
        public static readonly Origem loteQuitacao = new Origem() { chave = 44, descricao = "Contabilização em Lote de Quitação" };
        public static readonly Origem loteEncargos = new Origem() { chave = 45, descricao = "Contabilização em Lote de Encargos" };
        public static readonly Origem loteDiaria = new Origem() { chave = 46, descricao = "Contabilização em Lote de Atualização Diária" };
        public static readonly Origem loteAjustes = new Origem() { chave = 47, descricao = "Contabilização em Lote de Ajustes" };
        public static readonly Origem desfazerParcelas = new Origem() { chave = 51, descricao = "Desfazer Geração de Parcelas" };
        public static readonly Origem cancelamentoAmortizacao = new Origem() { chave = 52, descricao = "Cancelamento de Amortização" };
        public static readonly Origem cancelamentoQuitacao = new Origem() { chave = 53, descricao = "Cancelamento de Quitação" };
        public static readonly Origem desfazerEnvio = new Origem() { chave = 61, descricao = "Desfazer Envio" };
        public static readonly Origem desfazerRecebimento = new Origem() { chave = 62, descricao = "Desfazer Recebimento" };

        #endregion

    }
}
