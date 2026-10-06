using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FUNCEF.Planus.WebEmprestimo.Web.Componentes
{
    /// <summary>
    /// Contém as possíveis permissões de segurança no contextos do sistema.
    /// </summary>
    [Flags]
    [DataContract()]
    public enum PermissoesSistema : long
    {
        /// <summary>
        /// Representa uma máscara vazia.
        /// </summary>
        mascaraVazia = 0,

        /// <summary>
        /// Permissão para consultas.
        /// </summary>
        [EnumMember]
        consultar = 1,

        /// <summary>
        /// Permissão para inclusões.
        /// </summary>
        [EnumMember]
        incluir = 2,

        /// <summary>
        /// Permissão para alterações.
        /// </summary>
        [EnumMember]
        alterar = 4,

        /// <summary>
        /// Permissão para exclusões.
        /// </summary>
        [EnumMember]
        excluir = 8,

        /// <summary>
        /// Permissão para cancelar um processo.
        /// </summary>
        [EnumMember]
        cancelar = 16,

        /// <summary>
        /// Permissão para impressões.
        /// </summary>
        [EnumMember]
        imprimir = 32,

        /// <summary>
        /// Permissão para importar.
        /// </summary>
        [EnumMember]
        importar = 64,

        /// <summary>
        /// Permissão para Revisar.
        /// </summary>
        [EnumMember]
        revisar = 128,

        /// <summary>
        /// Permissão para Calcular.
        /// </summary>
        [EnumMember]
        calcular = 128,

        /// <summary>
        /// Permissão para Congelar.
        /// </summary>
        [EnumMember]
        congelar = 512,

        /// <summary>
        /// Permissão para Restaurar.
        /// </summary>
        [EnumMember]
        restaurar = 1024,

        /// <summary>
        /// Permissão para Duplicar.
        /// </summary>
        [EnumMember]
        duplicar = 2048,

        /// <summary>
        /// Permissão para Conceder.
        /// </summary>
        [EnumMember]
        conceder = 4096,

        /// <summary>
        /// Permissão para flag de excepcional.
        /// </summary>
        [EnumMember]
        excepcional = 8192,

        /// <summary>
        /// Permissão para flag de financiamento.
        /// </summary>
        [EnumMember]
        financiamento = 16384,

        //Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964 - Inicio
        /// <summary>
        /// Permissão para Flag Líquido Zero.
        /// </summary>
        [EnumMember]
        liquidoZero = 131072,

        /// <summary>
        /// Permissão para o campo Salário Base.
        /// </summary>
        [EnumMember]
        salarioBase = 262144,

        /// <summary>
        /// Permissão para o campo Margem Consignável.
        /// </summary>
        [EnumMember]
        margemConsignavel = 524288,

        /// <summary>
        /// Permissão para o campo Data da Solicitação.
        /// </summary>
        [EnumMember]
        dataSolicitacao = 1048576,

        /// <summary>
        /// Permissão para o campo Data da Assinatura.
        /// </summary>
        [EnumMember]
        dataAssinatura = 2097152,

        /// <summary>
        /// Permissão para o campo Data do Crédito.
        /// </summary>
        [EnumMember]
        dataCredito = 4194304,

        /// <summary>
        /// Permissão para o campo Data da 1º Parcela.
        /// </summary>
        [EnumMember]
        dataPrimeiraParcela = 8388608,

        /// <summary>
        /// Permissão para o combo Indexador.
        /// </summary>
        [EnumMember]
        indexador = 16777216,

        /// <summary>
        /// Permissão para o combo Data Amortização.
        /// </summary>
        [EnumMember]
        dataAmortizacao = 33554432,

        /// <summary>
        /// Permissão para o combo Data Quitação.
        /// </summary>
        [EnumMember]
        dataQuitacao = 67108864,

        /// <summary>
        /// Permissão para o Botão Chave Mestre.
        /// </summary>
        [EnumMember]
        chaveMestre = 134217728,

        /// <summary>
        /// Permissão para o Botão Ajustar Situação.
        /// </summary>
        [EnumMember]
        ajustarSituacao = 268435456,

        /// <summary>
        /// Permissão para o Botão Ajustar Saldo.
        /// </summary>
        [EnumMember]
        ajustarSaldo = 536870912,
        //Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964 - Fim

        //William Moreira da Silva - SOL 207977
        [EnumMember]
        abonar = 134217729,//134217728,//137438953472 / 1024

        [EnumMember]
        alterarDataVencimentoComEncargos = 268435457, //268435456,//274877906944 / 1024

        [EnumMember]
        alterarDataVencimentoSemEncargos = 536870913,//536870912,//549755813888 / 1024

        [EnumMember]
        baixarManualmente = 1073741824,//1099511627776 / 1024

        [EnumMember]
        desfazerBaixaManual = 2147483648,//2199023255552 / 1024

        [EnumMember]
        desvio = 4294967296,//4398046511104 / 1024

        [EnumMember]
        suspender = 8589934592,//8796093022208 / 1024

        [EnumMember]
        liberarSuspensao = 17179869184,//17592186044416 / 1024

        [EnumMember]
        confirmar = 34359738368//35184372088832 / 1024
        //William Moreira da Silva - SOL 207977
    }
}
