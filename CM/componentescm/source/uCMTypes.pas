//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: Incluido 2 subtipos.
//Responsável: Felipe A. Santos
//Descrição: foram incluído 2 subtipos referente ao cadastro de agente de integração
//           e cadastro de instituição de ensino.
//******************************************************************************
// Autor     : Fabio Fagundes
// Data      : 30/01/2006 e 22/03/2006
// Motivo    : Implementação do SubTipo    
//******************************************************************************

{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uCMTypes;

interface

Const
  _CMBCOMPARA = 'CmbCompara';
  _CKBCASE = 'CkbCase';
  _CKBFILTRO = 'CkbFiltro';
  _CMBFILTRO = 'CmbFiltro';
  _LSTFILTRO = 'LstFiltro';
  _RBTN = 'Rbtn';
  _CMBLKPFILTRO = 'CmbLkpFiltro';
  _EDTFILTRO = 'EdtFiltro';
  _PASTAHTML = '..\Html\';
  DriverOracle = 'ORACLE';
  DriverDB2 = 'DB2';
  DriverSQL = 'MSSQL';
  DriverSQLODBC = 'SQL Server';
  DriverPGODBC = 'PostgreSQL';
  CMFieldBlob = 'CM_ftBlob';
  CMInvalidField = 'CM_InvalidField';


{$I  CmRegConsts.Inc}


type
  TTipoFeriado = ( tfTodos, tfFederal, tfEstadual, tfMunicipal, tfMunicipalEstadual,
                   tfEstadualFederal, tfMunicipalFederal );

  TFiltroUsu = (fuAll, fuSoAtivos);
                   
  TStatusMensagem = (smNova);
  
  TTipoGetPessoa = (gpFull, gpDados, gpDocumentos);

  TTipoDestinatario = (tdUsuario, tdHospede);

  TOperacaoMensagem = (omEnviar, omMarcaLida, omMarcaNaoLida, omExcluir);

  TOperacao = (opVazio, opIdle, opInserir, opAlterar, opProcurar, opApagar);

  TTipoPessoa = (tpFisica, tpJuridica, tpOpcional);

  TOrigemAbortConfirma = (OaNone, OaBeforeConfirma, OaApplyInsert, OaApplyDelete, OaApplyEdit);

  TTipoControle = (tcEdit, tcCheckBox, tcComboBox, tcListBox, tcRadioGroup,
                   tcLookupCombo, tcMemo, tcMaskEdit, tcSpinEdit, tcProcuraST,
                   tcProcuraFC, tcProcuraCC, tcMontaSelect);

  TTipoDado = (tdString, tdReal, tdInteger, tdBoolean, tdDate);

  TActionExecute = (aeOk, aeCancelar, aeSair, aeAbort);
  {Device de saida do relatório}
  TReportDeviceType = (rdtScreen, rdtPrinter, rdtPdf, rdtTxt, rdtExcell, rdtRtf,
                       rdtJpg, rdtBmp, rdtTif, rdtHtml, rdtArchive);
  {Origem do relatório de ser exibido - Wizzard do Gerador de Relatórios,
  Consulta Manual do Gerador de relatório e Data Módulo }
  TTipoReport      = ( trGerador, trQryManual, trDataModulo, trFCmReport);
  {Paginação do relatório no preview - Todas as páginas primeira página,
  última página}
  TTipoPreview     = ( tpAllPages, tpFirstPage, tpLastPage );
  {Tipo de nome da empresa a ser exibido no 'label empresa' do relatório}
  TTipoNomeEmpresa = ( tnNomeEmpresa, tnRazaoSocial, tnNomeFantasia );
  {Tipo de Saída do relatório - Tela ou Impressora}
  TOutPutDevice    = ( todScreen, todPrinter );
  {Tipo de Conexão com a aplicação sevidora}
  TMidleWareConnection = (mwcSocket, mwcDCOM, mwcWEB);
  {Tipo de conexão com o banco de dados}
  TDbConnectionType = (cntBDE, cntADO, cntIB, cntDOA);
  {Indica se o controlador esta sendo instanciado pela aplicação cliente ou servidora}
  TConnectionSide = (cnsServer, cnsClient);
  {Tipo de conexão do database do sistema}
  TTipoServidor = (tsLocal, tsRemoto);

  TValida = (vcOk, vcSemTeste, vcNaoExiste, vcSintetica, vcAnalitica, vcEmBranco);

  TSubTipo = ( stAdminImovel,    stAgencia,        stAgenciaViagem,  stAgenteFidelidade,
               stAlimentados,    stAvalista,       stAverbadora,     stBanco,
               stBenefProcUh,    stBeneficiarioPP, stBenefSeguro,    stBolsaValores,   stCandidato,
               stCliente,        stConcierge,      stCorretValores,  stCartorio,
               stCustodiante,    stDependente,     stElegivel,       stEmissor,
               stEmpColigada,    stEstrangeiro,    stFilial,         stFornecedor,
               stFuncionario,    stFundacao,       stGestorCarteira, stHospede,
               stHotel,          stInstFinanceira, stLocatario,      stMutuario,
               stOperManut,
               stPatro,          stProdutor,       stPromotor,       stProprietarioUH,
               stRepresentante,  stResponsavel,    stSindicato,      stSeguradora,
               stTerceiro,       stVendedor,       stAdvogado,

               stAdmFdoInvest,

               stConselheiro,
               stInstituicaoEnsino, stAgenteInt // Felipe A. Santos SOL 229871.16137 PPM 407073
               );

  TRecSubTipo = Record Caption, Tabela, CampoId :string end;
  TListaSubTipo = array[TSubTipo] of TRecSubTipo;

  const ListaSubTipo : TListaSubTipo = (
           (Caption:'Administrador de Imóvel';Tabela:'ADMINIMOVEL';     CampoId:'IDADMINIMOVEL'),
           (Caption:'Agência bancária';       Tabela:'AGENCIABANCARIA'; CampoId:'IDPESSOA'),
           (Caption:'Agência de viagens';     Tabela:'AGENCIAVIAGEM';   CampoId:'IDPESSOA'),
           (Caption:'Agente Fidelidade';      Tabela:'AGENTEFIDELIDADE';   CampoId:'IDAGENTEFIEL'),
           (Caption:'Alimentados';            Tabela:'ALIMENTADOS';     CampoId:'IDPESSOA'),
           (Caption:'Avalista';               Tabela:'AVALISTA';        CampoId:'IDAVALISTA'),
           (Caption:'Averbadora';             Tabela:'AVERBADORA';      CampoId:'IDPESSOA'),
           (Caption:'Banco';                  Tabela:'BANCO';           CampoId:'IDPESSOA'),
           (Caption:'Beneficiário ou Procurador da UH';
                                              Tabela:'BENEFPROCUH';     CampoId:'IDBENEFPROCUH'),
           (Caption:'Beneficiario pelo Posto Prisma';       Tabela:'BENEFICIARIOPP';    CampoId:'IDBENEFICIARIOPP'),
           (Caption:'Beneficiários de Seguros';             Tabela:'BENEFSEGURO';       CampoId:'IDBENEFSEGURO'),
           (Caption:'Bolsa de valores';       Tabela:'BOLSAVALORES';    CampoId:'IDBOLSAVALORES'),
           (Caption:'Candidato';              Tabela:'CANDIDAT';        CampoId:'IDPESSOA'),
           (Caption:'Cliente';                Tabela:'CLIENTEPESS';     CampoId:'IDPESSOA'),
           (Caption:'Concierge';              Tabela:'CONCIERGE';       CampoId:'IDCONCIERGE'),
           (Caption:'Corretora de valores';   Tabela:'CORRETVALORES';   CampoId:'IDCORRETVALORES'),
           (Caption:'Cartório';               Tabela:'CARTORIO';        CampoId:'IDCARTORIO'),
           (Caption:'Custodiante';            Tabela:'CUSTODIANTE';     CampoId:'IDCUSTODIANTE'),
           (Caption:'Dependente';             Tabela:'DEPENDENTE';      CampoId:'IDPESSOA'),
           (Caption:'Elegivel';               Tabela:'ELEGIVEL';        CampoId:'IDPESSOA'),
           (Caption:'Emissor';                Tabela:'EMISSOR';         CampoId:'IDEMISSOR'),
           (Caption:'Empresa Coligada';       Tabela:'EMPCOLIGADA';     CampoId:'IDEMPCOLIGADA'),
           (Caption:'Estrangeiro';            Tabela:'ESTRANGEIRO';     CampoId:'IDPESSOA'),
           (Caption:'Filial';                 Tabela:'FILIALPESSOA';    CampoId:'IDFILIALPESSOA'),
           (Caption:'Fornecedor';             Tabela:'FORNSERV';        CampoId:'IDPESSOA'),
           (Caption:'Funcionario';            Tabela:'FUNCIONARIO';     CampoId:'IDPESSOA'),
           (Caption:'Fundação';               Tabela:'FUNDACAO';        CampoId:'IDPESSOA'),
           (Caption:'Gestor de carteira';     Tabela:'GESTORCARTEIRA';  CampoId:'IDGESTORCARTEIRA'),
           (Caption:'Hóspede';                Tabela:'HOSPEDE';         CampoId:'IDHOSPEDE'),
           (Caption:'Hotel';                  Tabela:'HOTEL';           CampoId:'IDHOTEL'),
           (Caption:'Instituição Financeira'; Tabela:'INSTFIN';         CampoId:'IDINSTFIN'),
           (Caption:'Locatario';              Tabela:'LOCATARIO';       CampoId:'IDLOCATARIO'),
           (Caption:'Mutuário';               Tabela:'MUTUARIO';        CampoId:'IDMUTUARIO'),
           (Caption:'Operador Manutenção';    Tabela:'OPERADORMANUT';   CampoId:'IDOPERADORMANUT'),
           (Caption:'Patrocinadora';          Tabela:'PATRO';           CampoId:'IDPESSOA'),
           (Caption:'Produtor';               Tabela:'PRODUTOR';        CampoId:'IDPESSOA'),
           (Caption:'Promotor';               Tabela:'PROMOTOR';        CampoId:'IDPROMOTOR'),
           (Caption:'Proprietario de UH';     Tabela:'PROPRIETARIOUH';  CampoId:'IDPROPRIETARIOUH'),
           (Caption:'Representante';          Tabela:'REPRESENTANTE';   CampoId:'IDREPRESENTANTE'),
           (Caption:'Responsavel';            Tabela:'RESPONSAVEL';     CampoId:'IDRESPONSAVEL'),
           (Caption:'Sindicato';              Tabela:'SINDICATO';       CampoId:'IDPESSOA'),
           (Caption:'Seguradora';             Tabela:'SEGURADORA';      CampoId:'IDSEGURADORA'),
           (Caption:'Terceiro';               Tabela:'TERCEIRO';        CampoId:'IDPESSOA'),
           (Caption:'Vendedor';               Tabela:'VENDEDOR';        CampoId:'IDPESSOA'),
           (Caption:'Advogado';               Tabela:'ADVOGADO';        CampoId:'IDPESSOA'),

           (Caption:'Adm. Fundos de Invest';  Tabela:'ADMFDOINVEST';    CampoId:'IDADMFDOINVEST'),

           (Caption:'Conselheiro';            Tabela:'CONSELHINVEST';   CampoId:'IDCONSELHINVEST'),

           // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
           (Caption:'Instituição de Ensino';  Tabela:'INSTITUICAOENSINO'; CampoId:'IDINSTITUICAOENSINO'),
           (Caption:'Agente de Integração';   Tabela:'AGENTEINT';         CampoId:'IDAGENTEINT' )
           // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim
           );

implementation

end.
