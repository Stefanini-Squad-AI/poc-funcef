using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.MecanismoRegras
{
    public abstract class RegraBase
    {
        protected Regra dadosRegra
        {
            get;
            private set;
        }

        public void atribuirEntidade(Regra regra)
        {
            this.dadosRegra = regra;
        }

        public virtual string chaveResultado 
        {
            get
            {
                if (this.dadosRegra == null)
                    throw new InvalidOperationException("Nenhuma entidade de regra foi atribuída a este mecanismo.");

                return dadosRegra.chaveRegra;
            }
        }

        public abstract IDictionary<string, object> obterAssinaturaParametros();

        public abstract object executar(IDictionary<string, object> parametros);
    }
}
