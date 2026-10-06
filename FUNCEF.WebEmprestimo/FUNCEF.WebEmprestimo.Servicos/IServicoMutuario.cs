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
using System.ServiceModel;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System.Collections;

namespace FUNCEF.Planus.WebEmprestimo.Servicos
{
    /// <summary>
    /// Serviço de manutenção de Mutuario do sistema.
    /// </summary>
    [ServiceContract(Namespace = ConstantesServico.namespaceServicos)]
    public interface IServicoMutuario : IServicoBase
    {
        /// <summary>
        /// Consulta Mutuários.
        /// </summary>
        /// <param name="contrato">Mutuário a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com o(s) mutuário(s) encontrado(s).</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Mutuario> consultarMutuario(Mutuario contrato, ref ParametrosConsulta parametros);


        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se o mutuario tem um beneficio Ativo
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <param name="idTitular"></param>
        /// <returns>Verdadeiro se o mutuario possuir beneficio ativo</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificarBeneficioAtivo(int idPessoa, int idTitular);

        /// <summary>
        /// Consulta Avalista.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Avalista"/> com o(s) avalista(s) encontrado(s).</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Avalistas> consultarAvalista(Avalistas avalista, ref ParametrosConsulta parametros);

        /// <summary>
        /// Obtém informações dos avalistas passados no parâmetro.
        /// </summary>
        /// <param name="avalistas">Avalista a ser buscados</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void obterInfoAvalista(ref Avalistas avalista);

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Retorna a matricula do mutuario pelo o seu idpessoa
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <returns>Matricula do participante</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        string obterMatricula(int idPessoa);

        /// <summary>
        /// Consulta Grupo Avalista.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.WebEmprestimo.Tipos.Avalista"/> com o(s) avalista(s) encontrado(s).</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Avalistas> consultarGrupoAvalista(Avalistas avalista, ref ParametrosConsulta parametros);


        /// <summary>
        /// Consulta Novo Avalista.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.WebEmprestimo.Tipos.Avalista"/> com o(s) avalista(s) encontrado(s).</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Avalistas> consultarNovoAvalista(Avalistas avalista, ref ParametrosConsulta parametros);

        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário</param>
        /// <param name="idDadosBancario">Identificação dos dados Bancários</param>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        [OperationContract(Name = "consultarContaBancarias")]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<DadosBancarios> consultarContaBancaria(int idMutuario, int idDadosBancario, long numeroContrato);


        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início
        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="matricula">Número da Matrícula.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        [OperationContract(Name = "consultarContaBancariaByMat")]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<DadosBancarios> consultarContaBancaria(string matricula);
        // Felipe A. Santos -  SOL 258704/17636 PPM 1008709 - início


        // Thiago Melo SOL 209377 Kintana 2021339
        /// <summary>
        /// Consulta nome do responsável
        /// </summary>
        /// <param name="idPessoa">Identificação do titular</param>
        /// <param name="idBenef">Identificação do mutuário</param>  
        /// <returns></returns>
        [OperationContract(Name = "retornaNomeResponsavel")]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        string retornaNomeResponsavel(int idPessoa, int idBenef);
        // Thiago Melo SOL 209377 Kintana 2021339



        /// <summary>
        /// Consulta a conta bancária do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        [OperationContract(Name = "consultarContaBancaria")]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DadosBancarios consultarContaBancaria(long numeroContrato);

        // Fernando Francisco Xavier - SOL 238824 PPM 508902
        /// <summary>
        /// Consulta a conta bancária Debito do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        [OperationContract(Name = "consultarContaBancariaDebito")]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DadosBancarios consultarContaBancariaDebito(long numeroContrato);
        // Fernando Francisco Xavier - SOL 238824 PPM 508902

        // SOL 199759
        /// <summary>
        /// Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<OutrasDividas> obterOutrasDividas(int idMutuario);
        // SOL 199759  

        //William Moreira da Silva SOL 238689
        /// <summary>
        /// Verifica se o usuario para o qual o processo esta sendo realizado é o mesmo que esta realizando o processo
        /// </summary>
        /// <param name="idPessoa">ID da pessoa para qual o processo esta sendo realizado</param>
        /// <returns>Verdadeiro se o Usuario é o mesmo e falso se for diferente.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificaMutuario(int idPessoa, string usuario);

        // SOL 199759
        /// <summary>
        /// Verifica se mutuário possui Avalistas.
        /// </summary>
        /// <param name="idInscricaoEmptmo">Identificador da inscricao de emprestimo para filtro.</param>
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Avalistas> obterAvalistas(long idInscricaoEmptmo);

        //William Moreira da Silva
        /// <summary>
        /// obtem lista de Cidade
        /// </summary>
        /// <param name="idCidade">Identificador do id da cidade para filtro.</param>       
        /// <returns>Informações de estado e pais de aconrdo com a cidade</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Cidade obterInfosCidade(int idCidade);

        /// <summary>
        /// obtem os documentos da pessoa .
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Documento> consultarDocPessoa(Int32 idPessoa);

        /// <summary>
        /// obtem dados da pessoa .
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Pessoa consultarInfPessoa(Int32 idPessoa);

        /// <summary>
        /// obtem os Endereços da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Endereco> consultarEndPessoa(Int32 idPessoa);

        /// <summary>
        /// obtem vinculo empregaticio da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool consultarVinculo(Int32 idPessoa);


        /// <summary>
        /// obtem os Endereço selecionado.
        /// </summary>
        /// <param name="idEndereco">Identificador do endereco para filtro.</param>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Endereco> consultarEndSelecionado(Int32 idEndereco);

        /// <summary>
        /// obtem os telefones selecionado.
        /// </summary>
        /// <param name="idTelefone">Identificador do endereco para filtro.</param>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Telefone> consultarTelSelecionado(Int32 idTelefone);

        /// <summary>
        /// obtem lista de documentos
        /// </summary>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Documento> consultarDocumentos(string tipoPessoa);

        /// <summary>
        /// obtem lista de UF
        /// </summary>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<UF> consultarUF();

        /// <summary>
        /// obtem lista de Cidades
        /// </summary>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Cidade> consultarCidades();

        /// <summary>
        /// obtem lista de Pais
        /// </summary>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Pais> consultarPais();

        /// <summary>
        /// obtem os contatos da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Contato> consultarContPessoa(Int32 idPessoa);

        /// <summary>
        /// obtem os Telefone da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Telefone> consultarTelPessoa(Int32 idPessoa);

        /// <summary>
        /// obtem o Avalista da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificador da pessoa para filtro.</param>        
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Avalistas consultarAvalistaPessoa(Int32 idPessoa);

        // SOL 199759 

        //BRUNO AZEVEDO - SOL 164198
        /// <summary>
        /// Consulta se o mutuário está bloqueado por plano ou não.
        /// </summary>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        [OperationContract(Name = "consultarBloqueioPlanoPrevidenciario")]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool consultarBloqueioPlanoPrevidenciario(int idplanoprev, string idplanocontabil);
        //BRUNO AZEVEDO - SOL 164198

        //BRUNO AZEVEDO - SOL 167098
        /// <summary>
        /// Consulta o código do banco da conta bancária do mutuário.
        /// </summary>
        /// <param name="idContaBancaria">Código da conta bancária.</param>
        [OperationContract(Name = "consultarCodigoBanco")]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        int consultarCodigoBanco(int idContaBancaria);
        //BRUNO AZEVEDO - SOL 167098

        /// <summary>
        /// Pesquisa as Contas da Caixa no sistema.
        /// </summary>
        /// <returns>Uma lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ContaCaixa"/> com os dados encontrados.</returns>
        [OperationContract()]
        List<ContaCaixa> listarContaCaixa();

        /// <summary>
        /// Lista tipo de recurso.
        /// </summary>
        [OperationContract()]
        List<TipoRecurso> listarTipoRecurso();

        /// <summary>
        /// Obtem dados do Mutuario.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        [OperationContract()]
        Mutuario obterDadosMutuario(string matricula);// Thiago Melo SOL 206149

        /// <summary>
        /// Consulta parametros do sistema.
        /// </summary>
        /// <returns>Hora de encerramenteo do sistema.</returns>
        [OperationContract()]
        ParametroSistema consultarParametroSistema();

        /// <summary>
        /// Verifica a atualização diaria do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário.</param>
        /// <param name="dataCredito">Data de Crédito.</param>
        /// <returns>Caso existe atualização.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificarAtualizacaoDiaria(int idMutuario, DateTime dataCredito, out string aviso);

        /// <summary>
        /// Consultar forma de pagamento.
        /// </summary>
        /// <param name="codigo">Código da forma de pagamento.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.FormaPagamento"/> com a(s) Forma(s) de Pagamento encontrada(s).</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<FormaPagamento> consultarFormaPagamento(string codigo);

        /// <summary>
        /// Obtem items em aberto de contrato do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificador do Mutuário</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<ItemContrato> obterItensEmAberto(long idContratoEmptmo); //NILTON - SOL201249 KTN1945208 - 22/02/2013

        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Inicio
        ///  <summary>
        /// Obtem a conta corrente selecionada.
        /// </summary>
        /// <param name="idMutuario">consultar ContaBancaria Operacao</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DadosBancarios consultarContaBancariaOperacao(int PIdCBancaria);
        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Fim

        /// <summary>
        /// Busca informações de falecimento de um mutuário
        /// </summary>
        /// <param name="idPessoa">Identificador do mutuário</param>
        /// <returns>Retorna Dictionary com as informações de falecimento de um mutuário</returns>
        //Saulo / FUNCEF
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Dictionary<string, object> buscaInfoFalecimento(int idPessoa);

        //Saulo/FUNCEF
        /// <summary>
        /// Busca os dados do mutuário do contrato.
        /// </summary>
        /// <param name="numContrato">Identificador do contrato.</param>
        /// <returns>Dictionary com as informações do mutuário do contrato pesquisado.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Dictionary<string, object> buscaInfoMutuario(long numContrato);


        //Petri Nocentini SOL 143476/16437 PPM 491462
        /// <summary>
        /// Busca os dados do mutuário do contrato.
        /// </summary>
        /// <param name="idPessoa">Identificador do contrato.</param>
        /// <returns>Dictionary com as informações do mutuário do contrato pesquisado.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        RelatorioContrato buscaInfoImpressaoContrato(int idPessoa);

        //William Santana - SIG 50871
        /// <summary>
        /// Obtem items em aberto de contrato do mutuário.
        /// </summary>
        /// <param name="ptipoContrato">ID do tipo de contrato</param>
        /// <param name="dataRef">Data da assinatura</param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        RelatorioContrato buscaInfoTaxas(string ptipoContrato, DateTime dataRef);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        RelatorioContrato buscaInfoImpressaoEmprestimoSemContrato(long NumeroContrato);
    }
}
