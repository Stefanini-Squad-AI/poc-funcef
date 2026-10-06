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

using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Web.Proxies
{
    public class ProxyModeloContrato
    {
       
        private int totalRegistrosInterno = 0;

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<ModeloContratoEmp> consultar(string tipocontrato, DateTime? DataInicioVigencia, string ordenacao, int indiceLinha, int maximoLinhas)
        {
            ///DateTime? DataVigencia = null;
            List<ModeloContratoEmp> modeloContrato = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao); 
            
            //if (DataInicioVigencia != null)
            //    DataVigencia = new DateTime(Convert.ToDateTime(DataInicioVigencia).Year, Convert.ToDateTime(DataInicioVigencia).Month, Convert.ToDateTime(DataInicioVigencia).Year, 0, 0, 0, 0);

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {              
                modeloContrato = cliente.contrato.consultarModelosContratos(tipocontrato, DataInicioVigencia, ref parametros);

                totalRegistrosInterno = parametros.totalRegistros;
            }
            
            return modeloContrato;
        }

        public int total(string tipocontrato, DateTime? DataInicioVigencia)
        {
           return totalRegistrosInterno;
        }

    }
}
