using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{   
    [Serializable]

    public class DescontoInadimplencia
    {
        public long numeroContrato { get; set; }
        public string modalidadeEmprestimo { get; set; }
        public DateTime dataCredito { get; set; }
        public string[] item { get; set; }
                            //{
                            //    get
                            //        {
                            //            if (item == null)
                            //                item = new string[0];
                            //            return item;
                            //        }
                            //     set
                            //        {
                            //            item = value;
                            //        }
                            //}

        public double[] valor { get; set; }
                        //{
                        //    get
                        //    {
                        //        if (valor == null)
                        //            valor = new double[0];
                        //        return valor;
                        //    }
                        //    set
                        //    {
                        //        valor = value;
                        //    }
                        //}
        public double[] percDesconto { get; set; }
        //{
        //    get
        //    {
        //        if (percDesconto == null)
        //            percDesconto = new double[0];
        //        return percDesconto;
        //    }
        //    set
        //    {
        //        percDesconto = value;
        //    }
        //}
        public double[] valorComDesconto { get; set; }
        //{
        //    get
        //    {
        //        if (valorComDesconto == null)
        //            valorComDesconto = new double[0];
        //        return valorComDesconto;
        //    }
        //    set
        //    {
        //        valorComDesconto = value;
        //    }
        //}
        public double totalVlrDivida { get; set; }
        public double totalPercDesconto { get; set; }
        public double totalVlrDesconto { get; set; }
        public double VlrDividaDesconto { get; set; }
        public double VlrSaldoDevedor { get; set; }
        //public InformacoesQuitacao itensQuitacao { get; set; }
        public int qtdePrestacoesRestantes { get; set; }
        public int sitBoleto { get; set; }
        public DateTime dataVencto { get; set; }
        public string msgErro { get; set; }
    }
}
                      