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
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados das Mutuário.
    /// </summary>
    public interface IAcessoMutuario : IObjetoAcesso
    {
        /// <summary>
        /// Consulta Plano Contábil do Mutuário.
        /// </summary>
        /// <param name="mutuario">Mutuário a ser filtrado</param>
        /// <param name="parametros">Plano previdenciário a ser consultado.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com o(s) planos dos Mutuário(s) encontrado(s).</returns>
        int consultarPlanoContabilMutuario(int idmutuario, int idplanoprev);

        /// <summary>
        /// Consulta Mutuário.
        /// </summary>
        /// <param name="contrato">Mutuário a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com o(s) Mutuário(s) encontrado(s).</returns>
        List<Mutuario> consultarMutuario(Mutuario mutuario, ref ParametrosConsulta parametros);

        /// <summary>
        /// Consulta Avalista.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Avalista"/> com o(s) avalista(s) encontrado(s).</returns>
        List<Avalistas> consultarAvalista(Avalistas avalista, ref ParametrosConsulta parametros);

        /// <summary>
        /// Obtém informações dos avalistas passados no parâmetro.
        /// </summary>
        /// <param name="avalistas">Avalista a ser buscados</param>
        void obterInfoAvalista(ref Avalistas avalista);

        /// <summary>
        /// Consulta Grupo Avalista.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.WebEmprestimo.Tipos.Avalista"/> com o(s) avalista(s) encontrado(s).</returns>
        List<Avalistas> consultarGrupoAvalista(Avalistas avalista, ref ParametrosConsulta parametros);

        /// <summary>
        /// Consulta Novo Avalista.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.WebEmprestimo.Tipos.Avalista"/> com o(s) avalista(s) encontrado(s).</returns>
        List<Avalistas> consultarNovoAvalista(Avalistas avalista, ref ParametrosConsulta parametros);

        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário</param>
        /// <param name="idDadosBancario">Identificação dos dados Bancários</param>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        List<DadosBancarios> consultarContaBancaria(int idMutuario, int idDadosBancario, long numeroContrato);

        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início
        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        List<DadosBancarios> consultarContaBancaria(string matricula);
        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - fim

        //BRUNO AZEVEDO - SOL 164198
        /// <summary>
        /// Consulta se o mutuário está bloqueado por plano ou não.
        /// </summary>
        bool consultarBloqueioPlanoPrevidenciario(int idplanoprev, string idplanocontabil);
        //BRUNO AZEVEDO - SOL 164198

        //BRUNO AZEVEDO - SOL 167098
        /// <summary>
        /// Consulta o código do banco da conta bancária do mutuário.
        /// </summary>
        /// <param name="idContaBancaria">Código da conta bancária.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        int consultarCodigoBanco(int idContaBancaria);
        //BRUNO AZEVEDO - SOL 167098

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se o mutuario tem um beneficio Ativo
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <param name="idTitular"></param>
        /// <returns>Verdadeiro se o mutuario possuir beneficio ativo</returns>
        bool verificarBeneficioAtivo(int idPessoa, int idTitular);

        // Thiago Melo SOL 209377 Kintana 2021339
        /// <summary>
        /// Consulta nome do responsavel.
        /// </summary>
        /// <param name="idPessoa">Identificação do titular</param>
        /// <param name="idBenef">Identificação do mutuário</param>  
        /// <returns></returns>       
        string retornaNomeResponsavel(int idPessoa, int idBenef);
        // Thiago Melo SOL 209377 Kintana 2021339

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Retorna a matricula do mutuario pelo o seu idpessoa
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <returns>Matricula do participante</returns>
        string obterMatricula(int idPessoa);

        //William Moreira da Silva SOL 238689
        /// <summary>
        /// Consulta a conta bancária do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        DadosBancarios consultarContaBancaria(long numeroContrato);

        /// <summary>
        /// Verifica se o usuario para o qual o processo esta sendo realizado é o mesmo que esta realizando o processo
        /// </summary>
        /// <param name="idPessoa">ID da pessoa o qual se esta realizando o processo</param>
        /// <param name="usuarioLogado">Usuario o qual esta logado</param>
        /// <returns>Verdadeiro se o Usuario é o mesmo e falso se for diferente.</returns>
        bool verificaMutuario(int idPessoa, string usuarioLogado);

        // Fernando Francisco Xavier - SOL 238824 PPM 508902
        /// <summary>
        /// Consulta a conta bancária Debito do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        DadosBancarios consultarContaBancariaDebito(long numeroContrato);
        // Fernando Francisco Xavier - SOL 238824 PPM 508902

        /// <summary>
        /// Pesquisa as Contas da Caixa no sistema.
        /// </summary>
        /// <returns>Uma lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ContaCaixa"/> com os dados encontrados.</returns>
        List<ContaCaixa> listarContaCaixa();

        /// <summary>
        /// Lista tipo de recurso.
        /// </summary>
        List<TipoRecurso> listarTipoRecurso();

        /// <summary>
        /// Obtem dados do Mutuario.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>                
        Mutuario obterDadosMutuario(string matricula); // Thiago Melo SOL 206149


        /// <summary>
        /// Obtem documentos da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        List<Documento> obterDocPessoa(int idPessoa);

        /// <summary>
        /// Obtem Enderecos da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        List<Endereco> obterEndPessoa(int idPessoa);

        /// <summary>
        /// Obtem vinculos empregaticios da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        bool verificarVinculo(int idPessoa);

        /// <summary>
        /// Obtem Endereco selecionado da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação do endereco que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        List<Endereco> obterEndSelecionado(int idEndereco);

        /// <summary>
        /// Obtem telefone selecionado da pessoa.
        /// </summary>
        /// <param name="idTelefone">Identificação do endereco que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Telefone"/> com as informações do Telefone pesquisado.</returns>
        List<Telefone> obterTelSelecionado(int idTelefone);

        /// <summary>
        /// Obtem dados da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        Pessoa obterInfPessoa(int idPessoa);

        /// <summary>
        /// obtem lista de documentos
        /// </summary>
        /// <param name="tipoPessoa">Identificador do tipo da pessoa para filtro.</param>        
        /// <returns></returns>
        List<Documento> obterDocumentos(string tipoPessoa);

        /// <summary>
        /// obtem lista de UF
        /// </summary>        
        /// <returns></returns>
        List<UF> obterUF();

        //William Moreira da Silva
        /// <summary>
        /// obtem lista de Cidade
        /// </summary>
        /// <param name="idCidade">Identificador do id da cidade para filtro.</param>       
        /// <returns>Informações de estado e pais de aconrdo com a cidade</returns>
        Cidade obterInfosCidade(int idCidade);

        /// <summary>
        /// obtem lista de Cidades
        /// </summary>        
        /// <returns></returns>
        List<Cidade> obterCidades();

        /// <summary>
        /// obtem lista de Pais
        /// </summary>        
        /// <returns></returns>
        List<Pais> obterPais();

        /// <summary>
        /// Obtem contatos da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        List<Contato> obterContPessoa(int idPessoa);

        /// <summary>
        /// Obtem telefone da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        List<Telefone> obterTelPessoa(int idPessoa);

        /// <summary>
        /// Obtem avalista da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        Avalistas obterAvalistaPessoa(int idPessoa);

        /// <summary>
        /// Verifica se o mutuário tem uma assinatura.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <param name="idTipoContrato">Identificador do tipo de contraro para filtro.</param>
        /// <returns>Dados da assinatura para validação.</returns>        
        Assinatura verificarAssinatura(int idTitular, int idMutuario, int idTipoContrato);// Thiago Melo SOL 204452 KTN 1976411

        /// <summary>
        ///  Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns>Retorna valores das dividas</returns>
        List<OutrasDividas> consultarOutrasDividas(int idMutuario);

        // SOL 199759
        /// <summary>
        ///  Verifica se mutuário possui avalistas.
        /// </summary>
        /// <param name="idInscricaoEmptmo">Identificador da inscricao emprestimo para filtro.</param>
        /// <returns>Retorna Avalistas</returns>
        List<Avalistas> consultarAvalistas(long idInscricaoEmptmo);

        /// <summary>
        /// Consulta contratos em aberto do mutuário
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário</param>
        /// <param name="idTipoemprestimo">Identificador do tipo do empréstimo</param>
        /// <param name="idTipoContrato">Identificador do tipo do contrato</param>
        /// <param name="dataCredito">Data de referência do crédito</param>
        /// <returns>Retorna contratos em aberto</returns>
        List<Contrato> consultarContratosEmAberto(int idMutuario, int idTitular, int idTipoemprestimo, int idTipoContrato, DateTime dataCredito);// Thiago Melo SOL 206149

        /// <summary>
        /// Verifica a atualização diaria do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário.</param>
        /// <param name="dataCredito">Data de Crédito.</param>
        /// <returns>Caso existe atualização.</returns>
        bool verificarAtualizacaoDiaria(int idMutuario, DateTime dataCredito);

        /// <summary>
        /// Consultar forma de pagamento.
        /// </summary>
        /// <param name="codigo">Código da forma de pagamento.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.FormaPagamento"/> com a(s) Forma(s) de Pagamento encontrada(s).</returns>
        List<FormaPagamento> consultarFormaPagamento(string codigo);

        /// <summary>
        /// Obtem items em aberto de contrato do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificador do Mutuário</param>
        List<ItemContrato> obterItensEmAberto(long idContratoEmptmo);//NILTON - SOL201249 KTN1945208 - 22/02/2013        
        
        
        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Inicio
        /// <summary>
        /// Consulta a conta bancária do mutuário.
        /// </summary>
        /// <param name="PIdCBancaria">ID da conta bancaria.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        DadosBancarios consultarContaBancariaOperacao(int PIdCBancaria);
        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Fim

        //Saulo/FUNCEF
        /// <summary>
        /// Busca as informações de falecimento de um mutuário
        /// </summary>
        /// <param name="idPessoa">Identificador do mutuário</param>
        Dictionary<string, object> buscaInfoFalecimento(int idPessoa);

        //Saulo/FUNCEF
        /// <summary>
        /// Busca os dados do mutuário do contrato.
        /// </summary>
        /// <param name="numContrato">Identificador do contrato.</param>
        /// <returns>Dictionary com as informações do mutuário do contrato pesquisado.</returns>
        Dictionary<string, object> buscaInfoMutuario(long numContrato);


        //Petri Nocentini SOL 143476/16437 PPM 491462
        /// <summary>
        /// Busca os dados do mutuário do contrato.
        /// </summary>
        /// <param name="idPessoa">Identificador do contrato.</param>
        /// <returns>Dictionary com as informações do mutuário do contrato pesquisado.</returns>
        RelatorioContrato buscaInfoImpressaoContrato(int idPessoa);

        //SIG 67808 - Matias
        bool verificarExistenciaEquacionamento(int IdPessoa, int IdTitular);

        //SIG 67808 - Matias
        double BuscaUltimaPrestacaoFGQC(double IdContratoEmptmo);

        //SIG 67808 - Matias
        int VerificaTempoInadPrimeiraPrestatacao(long NumContrato);
        //William Santana - SIG 50871
        /// <summary>
        /// Obtem items em aberto de contrato do mutuário.
        /// </summary>
        /// <param name="ptipoContrato">ID do tipo de contrato</param>
        /// <param name="dataRef">Data da assinatura</param>
        RelatorioContrato buscaInfoTaxas(string ptipoContrato, DateTime dataRef);

        RelatorioContrato buscaInfoImpressaoEmprestimoSemContrato(long NumeroContrato);
    }
}
