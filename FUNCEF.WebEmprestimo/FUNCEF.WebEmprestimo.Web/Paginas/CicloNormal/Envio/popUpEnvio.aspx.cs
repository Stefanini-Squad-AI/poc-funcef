using System;
using FUNCEF.Planus.GlobalWeb.Web.IU;

using FUNCEF.Planus.Componentes;
using FUNCEF.Planus.Componentes.Web;

using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;


namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Envio
{
    public partial class popUpEnvio : PaginaSeguraComEstado
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjetoEnvio envio = new ObjetoEnvio();
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                envio = cliente.contrato.obterInfosEnvioProcessando();
            }

            if (envio.idContratoEmptmo != 0)
            {
                lblContrato.Text = envio.idContratoEmptmo.ToString();
            }
            lblDataVencimento.Text = envio.dataVencto.ToShortDateString();
            lblPatrocinadoras.Text = envio.patrocinadoras;
            lblPlanos.Text = envio.planos;
            lblExecutadoPor.Text = envio.usuario;
            lblIniciadoEm.Text = envio.dataHora.ToString();
            chkFinancAReceber.Checked = (envio.flgFinanRec == 1);
            chkFolhaBenef.Checked = (envio.flgFolhaBenef == 1);
            chkFolhaPatro.Checked = (envio.flgFolhaPatro == 1);
        }

        public override string identificacaoContexto
        {
            get { return IdentificacaoContexto.emprestimo; }
        }

        public override string permissoesExigidas
        {
            get { return PermissoesSistema.mascaraVazia.ToString(); }
        }
    }
}