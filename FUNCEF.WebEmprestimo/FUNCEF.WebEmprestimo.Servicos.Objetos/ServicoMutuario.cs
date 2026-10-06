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
#region SOL 258704/17636 / PPM 1008709
/// - SOL 258704/17636 / PPM 1008709
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 12/08/2015
///
/// Descrição da Alteração:
/// Criação do Método ObterContaBancaria no conectorWeb.
/// 
#endregion
#region SOL 238824 / PPM 508902
///
/// Autor:
/// Fernando Francisco Xavier
///
/// Data da Alteração:
/// 09/09/2014 15:39:10
///
/// Descrição da Alteração:
/// O Sistema não diferenciava conta de credito e debito
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.WCF;
using FUNCEF.Planus.Componentes.ServicoWeb;
using FUNCEF.Planus.WebEmprestimo.Negocio;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System.Collections;

namespace FUNCEF.Planus.WebEmprestimo.Servicos.Objetos
{
    /// <summary>
    /// Serviço de manutenção de estado do sistema.
    /// </summary>
    [ExceptionShielding("Politica Sistema")]
    [InspecaoRequisicao()]
    public class ServicoMutuario : ServicoBase, IServicoMutuario
    {

        /// <summary>
        /// Consulta Mutuários.
        /// </summary>
        /// <param name="contrato">Mutuário a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com o(s) mutuário(s) encontrado(s).</returns>
        public List<Mutuario> consultarMutuario(Mutuario mutuario, ref ParametrosConsulta parametros)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarMutuario(mutuario, ref parametros);
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se o mutuario tem um beneficio Ativo
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <param name="idTitular"></param>
        /// <returns>Verdadeiro se o mutuario possuir beneficio ativo</returns>
        public bool verificarBeneficioAtivo(int idPessoa, int idTitular)
        {
            GerenciadorMutuario gerenciador = new GerenciadorMutuario();
            return gerenciador.verificarBeneficioAtivo(idPessoa, idTitular);
        }

        /// <summary>
        /// Consulta Avalistas.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Avalistas"/> com o(s) avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarAvalista(Avalistas avalista, ref ParametrosConsulta parametros)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarAvalista(avalista, ref parametros);
        }

        /// <summary>
        /// Obtém informações dos avalistas passados no parâmetro.
        /// </summary>
        /// <param name="avalistas">Avalista a ser buscados</param>
        public void obterInfoAvalista(ref Avalistas avalista)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            gerenciadorMutuario.obterInfoAvalista(ref avalista);
        }

        /// <summary>
        /// Consulta Grupo Avalistas.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.WebEmprestimo.Tipos.Avalistas"/> com o(s) avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarGrupoAvalista(Avalistas avalista, ref ParametrosConsulta parametros)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarGrupoAvalista(avalista, ref parametros);
        }



        /// <summary>
        /// Consulta Novo Avalistas.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.WebEmprestimo.Tipos.Avalistas"/> com o(s) avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarNovoAvalista(Avalistas avalista, ref ParametrosConsulta parametros)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarNovoAvalista(avalista, ref parametros);
        }


        // SOL 199759
        /// <summary>
        /// Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns></returns>
        public List<OutrasDividas> obterOutrasDividas(int idMutuario)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterOutrasDividas(idMutuario);
        }

        // SOL 199759

        // SOL 199759
        /// <summary>
        /// Verifica se mutuário possui Avalistas.
        /// </summary>
        /// <param name="idInscricaoEmptmo">Identificador da inscricao emprestimo para filtro.</param>
        /// <returns></returns>
        public List<Avalistas> obterAvalistas(long idInscricaoEmptmo)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterAvalistas(idInscricaoEmptmo);
        }
        // SOL 199759

        /// <summary>
        /// obtem os documentos da pessosa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>
        /// <returns></returns>
        public List<Documento> consultarDocPessoa(Int32 idPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterDocPessoa(idPessoa);
        }

        //William Moreira da Silva
        /// <summary>
        /// obtem lista de Cidade
        /// </summary>
        /// <param name="idCidade">Identificador do id da cidade para filtro.</param>       
        /// <returns>Informações de estado e pais de aconrdo com a cidade</returns>
        public Cidade obterInfosCidade(int idCidade)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterInfosCidade(idCidade);
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Retorna a matricula do mutuario pelo o seu idpessoa
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <returns>Matricula do participante</returns>
        public string obterMatricula(int idPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterMatricula(idPessoa);
        }

        /// <summary>
        /// obtem daos da pessosa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>        
        /// <returns></returns>
        public Pessoa consultarInfPessoa(Int32 idPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterInfPessoa(idPessoa);
        }

        /// <summary>
        /// obtem os enderecos da pessosa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>
        /// <returns></returns>
        public List<Endereco> consultarEndPessoa(Int32 idPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterEndPessoa(idPessoa);
        }

        /// <summary>
        /// obtem os enderecos da pessosa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>
        /// <returns></returns>
        public bool consultarVinculo(Int32 idPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.verificarVinculo(idPessoa);
        }

        /// <summary>
        /// obtem o endereco Selecionado.
        /// </summary>
        /// <param name="idEndereco">Identificador do endereco para filtro.</param>       
        /// <returns></returns>
        public List<Endereco> consultarEndSelecionado(Int32 idEndereco)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterEndSelecionado(idEndereco);
        }

        /// <summary>
        /// obtem o telefone Selecionado.
        /// </summary>
        /// <param name="idPessoa">Identificador do endereco para filtro.</param>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>
        /// <returns></returns>
        public List<Telefone> consultarTelSelecionado(Int32 idTelefone)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterTelSelecionado(idTelefone);
        }

        //William Moreira da Silva SOL 238689
        /// <summary>
        /// Verifica se o usuario para o qual o processo esta sendo realizado é o mesmo que esta realizando o processo
        /// </summary>
        /// <param name="idPessoa">ID da pessoa para qual o processo esta sendo realizado</param>
        /// <returns>Verdadeiro se o Usuario é o mesmo e falso se for diferente.</returns>
        public bool verificaMutuario(int idPessoa, string usuario)
        {
            GerenciadorMutuario gerenciadoMutuario = new GerenciadorMutuario();
            return gerenciadoMutuario.verificaMutuario(idPessoa, usuario);
        }

        /// <summary>
        /// obtem lista de documentos
        /// </summary>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>        
        /// <returns></returns>
        public List<Documento> consultarDocumentos(string tipoPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterDocumentos(tipoPessoa);
        }

        /// <summary>
        /// obtem lista de UF
        /// </summary>       
        /// <returns></returns>
        public List<UF> consultarUF()
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterUF();
        }

        /// <summary>
        /// obtem lista de Cidades
        /// </summary>       
        /// <returns></returns>
        public List<Cidade> consultarCidades()
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterCidades();
        }


        /// <summary>
        /// obtem lista de Pais
        /// </summary>       
        /// <returns></returns>
        public List<Pais> consultarPais()
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterPais();
        }


        /// <summary>
        /// obtem os contatos da pessosa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>
        /// <returns></returns>
        public List<Contato> consultarContPessoa(Int32 idPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterContPessoa(idPessoa);
        }

        // Fernando Francisco Xavier - SOL 238824 PPM 508902
        /// Consulta a conta bancária do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public DadosBancarios consultarContaBancaria(long numeroContrato)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarContaBancaria(numeroContrato);
        }
        // Fernando Francisco Xavier - SOL 238824 PPM 508902


        // Fernando Francisco Xavier - SOL 238824 PPM 508902
        /// Consulta a conta bancária Debito do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public DadosBancarios consultarContaBancariaDebito(long numeroContrato)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarContaBancariaDebito(numeroContrato);
        }
        // Fernando Francisco Xavier - SOL 238824 PPM 508902

        // Thiago Melo SOL 209377 Kintana 2021339
        /// <summary>
        /// Consulta nome do responsavel.
        /// </summary>
        /// <param name="idPessoa">Identificação do titular</param>
        /// <param name="idBenef">Identificação do mutuário</param>  
        /// <returns></returns>
        public string retornaNomeResponsavel(int idPessoa, int idBenef)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.retornaNomeResponsavel(idPessoa, idBenef);
        }
        // Thiago Melo SOL 209377 Kintana 2021339


        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>
        /// <returns></returns>
        public List<Telefone> consultarTelPessoa(Int32 idPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterTelPessoa(idPessoa);
        }

        /// <summary>
        /// obtem os telefone da pessosa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>
        /// <returns></returns>
        public Avalistas consultarAvalistaPessoa(Int32 idPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterAvalistaPessoa(idPessoa);
        }

        // SOL 199759

        //BRUNO AZEVEDO - SOL 164198
        /// <summary>
        /// Consulta se o mutuário está bloqueado por plano ou não.
        /// </summary>
        public bool consultarBloqueioPlanoPrevidenciario(int idplanoprev, string idplanocontabil)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarBloqueioPlanoPrevidenciario(idplanoprev, idplanocontabil);
        }
        //BRUNO AZEVEDO - SOL 164198

        //BRUNO AZEVEDO - SOL 167098
        /// <summary>
        /// Consulta o código do banco da conta bancária do mutuário.
        /// </summary>
        /// <param name="idContaBancaria">Código da conta bancária.</param>
        public int consultarCodigoBanco(int idContaBancaria)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarCodigoBanco(idContaBancaria);
        }
        //BRUNO AZEVEDO - SOL 167098

        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário</param>
        /// <param name="idDadosBancario">Identificação dos dados Bancários</param>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public List<DadosBancarios> consultarContaBancaria(int idMutuario, int idDadosBancario, long numeroContrato)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarContaBancaria(idMutuario, idDadosBancario, numeroContrato);
        }

        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início
        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="matricula">Número da Matrícula</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public List<DadosBancarios> consultarContaBancaria(string matricula)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarContaBancaria(matricula);
        }

        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início

        /// <summary>
        /// Pesquisa as Contas da Caixa no sistema.
        /// </summary>
        /// <returns>Uma lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ContaCaixa"/> com os dados encontrados.</returns>
        public List<ContaCaixa> listarContaCaixa()
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.listarContaCaixa();
        }

        /// <summary>
        /// Lista tipo de recurso.
        /// </summary>
        public List<TipoRecurso> listarTipoRecurso()
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.listarTipoRecurso();
        }

        /// <summary>
        /// Obtem dados do Mutuario.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public Mutuario obterDadosMutuario(string matricula)// Thiago Melo SOL 206149
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterDadosMutuario(matricula);// Thiago Melo SOL 206149
        }

        /// <summary>
        /// Consulta parametros do sistema.
        /// </summary>
        /// <returns>Hora de encerramenteo do sistema.</returns>
        public ParametroSistema consultarParametroSistema()
        {
            GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
            return gerenciadorRegra.consultarParametroSistema();
        }

        /// <summary>
        /// Verifica a atualização diaria do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário.</param>
        /// <param name="dataCredito">Data de Crédito.</param>
        /// <returns>Caso existe atualização.</returns>
        public bool verificarAtualizacaoDiaria(int idMutuario, DateTime dataCredito, out string aviso)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.verificarAtualizacaoDiaria(idMutuario, dataCredito, out aviso);
        }

        /// <summary>
        /// Consultar forma de pagamento.
        /// </summary>
        /// <param name="codigo">Código da forma de pagamento.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.FormaPagamento"/> com a(s) Forma(s) de Pagamento encontrada(s).</returns>
        public List<FormaPagamento> consultarFormaPagamento(string codigo)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarFormaPagamento(codigo);
        }

        /// <summary>
        /// Obtem items em aberto de contrato do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificador do Mutuário</param>
        public List<ItemContrato> obterItensEmAberto(long idContratoEmptmo)//NILTON - SOL201249 KTN1945208 - 22/02/2013
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.obterItensEmAberto(idContratoEmptmo);
        }

        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Inicio
        /// <summary>
        /// Consulta a conta bancária do mutuário.
        /// </summary>
        /// <param name="PIdCBancaria">ID da conta bancária.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public DadosBancarios consultarContaBancariaOperacao(int PIdCBancaria)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarContaBancariaOperacao(PIdCBancaria);
        }
        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Fim

        /// <summary>
        /// Busca informações de falecimento de um mutuário
        /// </summary>
        /// <param name="idPessoa">Identificador do mutuário</param>
        /// <returns>Retorna Dictionary com as informações de falecimento de um mutuário</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoFalecimento(int idPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.buscaInfoFalecimento(idPessoa);
        }

        //Saulo/FUNCEF
        /// <summary>
        /// Busca os dados do mutuário do contrato.
        /// </summary>
        /// <param name="numContrato">Identificador do contrato.</param>
        /// <returns>Dictionary com as informações do mutuário do contrato pesquisado.</returns>
        public Dictionary<string, object> buscaInfoMutuario(long numContrato)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.buscaInfoMutuario(numContrato);
        }


        //Petri Nocentini SOL 143476/16437 PPM 491462
        /// <summary>
        /// Busca os dados do contrato a ser impresso.
        /// </summary>
        /// <param name="idPessoa">ID da Pessoa.</param>
        /// <returns>Dictionary com as informações do contrato a ser impresso.</returns>
        public RelatorioContrato buscaInfoImpressaoContrato(int idPessoa)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();

            return gerenciadorMutuario.buscaInfoImpressaoContrato(idPessoa);

        }

        //William Santana - SIG 50871 - começo
        /// <summary>
        /// Obtem items em aberto de contrato do mutuário.
        /// </summary>
        /// <param name="ptipoContrato">ID do tipo de contrato</param>
        /// <param name="dataRef">Data da assinatura</param>
        public RelatorioContrato buscaInfoTaxas(string ptipoContrato, DateTime dataRef)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();

            return gerenciadorMutuario.buscaInfoTaxas(ptipoContrato, dataRef);

        }
        //William Santana - SIG 50871 - final

        
        public RelatorioContrato buscaInfoImpressaoEmprestimoSemContrato(long NumeroContrato)
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();

            return gerenciadorMutuario.buscaInfoImpressaoEmprestimoSemContrato(NumeroContrato);

        }
        
    }
}
