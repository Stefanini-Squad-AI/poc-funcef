#region SIG 57675
///
/// Autor:
/// Marcelo Valério Ferreira
///
/// Data da Alteração:
/// 09/01/2018 13:05:00
///
/// Descrição da Alteração:
/// Verificação de duplicidade de concessão de 13º salário para o participante.
///
#endregion
#region SOL 224034/17909 PPM 1165556
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 17/03/2016
/// 
/// Descrição da Alteração:
/// Criação da opção de Acordo Judicial
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
    /// Serviço de manutenção de estado do sistema.
    /// </summary>
    [ServiceContract(Namespace = ConstantesServico.namespaceServicos)]
    public interface IServicoConcessao : IServicoBase
    {
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        int obterEventoJudicial(); // Felipe A. Santos - SOL 224034/17909 PPM 1165556

        /// <summary>
        /// Calcula a data da primeira parcela.
        /// </summary>
        /// <param name="idPatrocinadora">Identificação da Patrocinadora para filtro.</param>
        /// <param name="idPlanoPrevidenciario">Identificação do Plano Previdenciario para filtro.</param>
        /// <returns>Data da Cobrança.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DateTime calcularPrimeiraParcela(int idPatrocinadora, int idPlanoPrevidenciario, DateTime dataCredito);

        /// <summary>
        /// Verifica se o mutuário tem uma assinatura.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <param name="idTipoContrato">Identificador do tipo de contraro para filtro.</param>
        /// <returns>Validade da assinatura.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificarAssinatura(int idTitular, int idMutuario, int idTipoContrato, int? flgtrataassinat, out List<string> listaAvisos);// Thiago Melo SOL 204452 KTN 1976411        

        /// <summary>
        /// Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool consultarOutrasDividas(int idMutuario, out string aviso);

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

        // SOL 199759
        /// <summary>
        /// Verifica se mutuário possui Avalista.
        /// </summary>
        /// <param name="idInscricaoEmptmo">Identificador da inscrição do emprestimo.</param>
        /// <returns></returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Avalistas> obterAvalistas(long idInscricaoEmptmo);
        // SOL 199759

        /// <summary>
        /// Verifica se existe outras Concessões.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário para filtro.</param>
        /// <param name="dataReferencia">Data de refêrencia para filtro.</param>
        /// <param name="idTipocontrato">Identificação do tipo do contrato para filtro.</param>
        /// <returns>Se existe Concessões associadas.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool verificarConcessaoExistente(int idMutuario, DateTime dataReferencia, int idTipoContrato, out string aviso);

        //Jessica Y. Oshiro - SOL 235314
        /// <summary>
        /// Verifica se data credito é dia util.
        /// </summary>
        /// <param name="dataCredito">Data credito como parametro</param>
        /// <returns>Se data credito é dia util.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        //bool verificaDataUtil(DateTime dataUtil);
        bool verificaDataUtil(DateTime dataUtil);

        /// <summary>
        /// Verficia se existe suspensão associada ao mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário a ser filtrada.</param>
        /// <param name="dataReferencia">Data de referência da suspensão a ser filtrada.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Suspensao"/> com os dados encontrados.</returns>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Suspensao consultarSuspensao(int idMutuario, int idTipoContratoEmpto, DateTime dataReferencia, bool veioConector, out string aviso);//MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567
        //William Moreira da Silva - SOL 224562 KTN 2059616 - Inclusão do parametro veioConector

        // Thiago Melo SOL 202311 KINTANA 1956671 INI
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void consultarContratosAnteriores(int idpessoa, int idMutuario, DateTime hmeData, int idTipoEmprestimo, int quitavel, int idTipoContrato, bool flgExcepcional, out string aviso, string contratosSelecionados = null);
        // Thiago Melo SOL 202311 KINTANA 1956671

        //William Moreira da Silva - SOL 204765 KTN 1984008 agora faz-se a verificação na camada de gerenciamento
        //MARCIO SANCHES SPINOSA - SOL 204760
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<long> obterContratoEmptmo(int idMutuario, int idBeneficiario, DateTime dataCredito);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        double existemItensEmAberto(long idcontratoemptmo, bool usaData, DateTime dataCredito, bool usaMes, int ano, int mes, out string aviso);
        //MARCIO SANCHES SPINOSA - SOL 204760
        //William Moreira da Silva - SOL 204765 KTN 1984008 agora faz-se a verificação na camada de gerenciamento

        //SIG 63057
        //William Moreira da Silva - SOL 143476/16437 - incluido o paramentro do relatorio
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        long gravar(Contrato contrato, List<Historico> itensHistorico, List<ItemContrato> itensContrato, List<Contrato> contratosAQuitar, RelatorioContrato relatorio, string ContratoHTML);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]                                                                                                                                                                    //BRUNO AZEVEDO SOL213592_KTN2040335        
        List<Contrato> calcular(int idMutuario, int idTipoContrato, string matricula, ref Concessao concessao, ref List<ItemContrato> itensConcessao, List<long> contratosSelecionados, out List<string> listaMensagens, bool bCalculaAnteriores, List<Contrato> ContratosCalculados, int? idBarra, bool CampanhaInadimplencia); //Thiago Melo SOL 206149

        //SIG 57675 - Marcelo Valério Ferreira
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]                                                                                                                                                                    //BRUNO AZEVEDO SOL213592_KTN2040335
        bool verificarConcessao13(int idPessoa, int idMutuario, DateTime? dtPrimeiraParcela);

        //William Moreira da Silva - SOL 247419
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        int? consultarUltimoIdTabela(string tabela);

        //Nilton
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        TipoContrato ConsultarTipoContrato(int idTipoContrato);

        // xavier SOL 178579
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Grupoexcepcional> listarGrupoExcepcional();

        /// <summary>
        /// Inclui ContratoEmptmoXExcepcional
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirContratoEmptmoXExcepcional(Int64 idContrato, int idGrupoExcepcional);
        // xavier SOL 178579

        //WILLIAM MOREIRA DA SILVA barraProgresso
        /// <summary>
        /// retorna o status da barra de Progresso
        /// </summary>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<int> obterStatusBarraProgresso(int? idBarraProgresso);
        //WILLIAM MOREIRA DA SILVA barraProgresso

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirContratoEmptmoSuspconcessao(Int64 idContrato, int idPessoa, string Observacao, int IdTipoSuspensao, int QtdMesesSuspensao, string ModalidadesBloqueio);
        //Sadi SOL213592_Kintana2040335

        /// <summary>
        /// Incluir endereço da pessoa
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Int32 IncluirEndereco(Endereco endPessoa);

        /// <summary>
        /// Incluir documento da pessoa
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirDocPessoa(List<Documento> documentoPessoa, Int32 idPessoa);

        /// <summary>
        /// alterar documento da pessoa
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void alterarDocPessoa(List<Documento> documentoPessoa, Int32 idPessoa);

        /// <summary>
        /// Incluir a pessoa
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        Int32 incluirPessoa(List<Pessoa> pessoa);

        /// <summary>
        /// alterar a pessoa
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void alterarPessoa(List<Pessoa> pessoa);

        /// <summary>
        /// excluir a pessoa
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluirPessoa(List<Pessoa> pessoa);

        /// <summary>
        /// Incluir a avalista
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirNovoAvalista(List<Avalistas> avalista);

        /// <summary>
        /// Alterar a avalista
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void alterarNovoAvalista(List<Avalistas> avalista);

        /// <summary>
        /// Excluir a avalista
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluirNovoAvalista(Int32 idAvalista);

        /// <summary>
        /// Incluir telefone
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirTelefone(Telefone telefone);

        /// <summary>
        /// Alterar telefone
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void alterarTelefone(Telefone telefone);

        /// <summary>
        /// Excluir telefone
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluirTelefones(List<Telefone> telefones);

        /// <summary>
        /// Excluir telefone
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluirTelefone(Telefone telefone);

        /// <summary>
        /// incluir a contato
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirContato(Contato contato);

        /// <summary>
        /// alterar a contato
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void alterarContato(Contato contato);

        /// <summary>
        /// Excluir relacionamento entre Telefone e Contato
        /// </summary>
        /// <param name="idTelContato"></param>
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluirTelContato(Int32 idTelContato);

        /// <summary>
        /// excluir a contato
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluirContato(Contato contato);

        /// <summary>
        /// excluir a contato
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluirContatos(List<Contato> contatos);

        /// <summary>
        /// Alterar endereço da pessoa
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void alterarEndereco(Endereco endPessoa);

        /// <summary>
        /// Alterar endereço da pessoa
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void incluirTelefoneContato(List<Telefone> telefones, List<Contato> contatos, int idEndereco);

        /// <summary>
        /// Excluir endereço da pessoa
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluirEndereco(Int32 idEndereco);

        /// <summary>
        /// Excluir telefones associados ao endereço da pessoa
        /// </summary>
        /// 
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void excluirTelefoneEndereco(Int32 idEndereco);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        List<Contrato> BuscarContratosAbertos(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato, DateTime dataCredito);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        bool VerificaExistenciaContratoInadimplente(int IdPessoa);

        //Campanha Desconto
        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DateTime BuscarDataCredito(long idPessoa, long idTitular, int idPlano, int idPatrocinadora);
        

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        DescontoInadimplencia BuscaInadimplenciaDesconto(long NumeroContrato, long IdPessoa, DateTime DataCalculo, int TipoProposta, double saldoDevedor, List<ItemDescontoContrato> descontoQuitacao, long IdCalculo = 0);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void CancelarConcessaoEmprestimo(Contrato contrato, string protocoloCRM, string UsuarioLogado);

        [OperationContract()]
        [FaultContract(typeof(ContratoFaltaNegocio))]
        void IncluirEventoDeCobranca(double NumeroContrato, DateTime DataOperacao, int IdTipoEvento, string Observacao);
    }
}
