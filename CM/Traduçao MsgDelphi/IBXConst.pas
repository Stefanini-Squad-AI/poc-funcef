{********************************************************}
{                                                        }
{       Borland Delphi Visual Component Library          }
{       InterBase Express core components                }
{                                                        }
{       Copyright (c) 1998-2000 Inprise Corporation      }
{                                                        }
{    InterBase Express is based in part on the product   }
{    Free IB Components, written by Gregory H. Deatz for }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.     }
{    Free IB Components is used under license.           }
{                                                        }
{********************************************************}

unit IBXConst;

interface

uses IBUtils;

resourcestring
{ generic strings used in code }
  SIBDatabaseEditor = 'Da&tabase Editor...';
  SIBTransactionEditor = '&Transaction Editor...';
  SDatabaseFilter = 'Arquivos de Bancos de Dados (*.gdb)|*.gdb|Todos Arquivos (*.*)|*.*';
  SDisconnectDatabase = 'Banco de Dados está conectado. Disconecta e continua?';
  SCommitTransaction = 'A Transação está ativa. Faz Rollback e continua?';
  SExecute = 'E&xecutar';
  SNoDataSet = 'Nenhum dataset associado';
  SSQLGenSelect = 'É necessário selecionar pelo menos um campo chave e um campo para atualização';
  SSQLNotGenerated = 'Comando SQL de Update não foi gerado, Sair assim mesmo?';
  SIBUpdateSQLEditor = '&UpdateSQL Editor...';
  SIBDataSetEditor = '&Dataset Editor...';
  SSQLDataSetOpen = 'Não foi possível determinar os nomes dos campos para %s';
  SDefaultTransaction = '%s, Padrão';

{ strings used in error messages}
  SUnknownError = 'Erro desconhecido';
  SInterBaseMissing = 'A Bibliteca InterBase gds32.dll não foi encontrada no path. Por favor instale o InterBase para utilizar esta funcionalidade';
  SInterBaseInstallMissing = 'InterBase Install DLL ibinstall.dll not found in the path. Por favor instale o InterBase 6 para utilizar esta funcionalidade';
  SIB60feature = '%s é uma função do InterBase 6. Por favor atualize para InterBase 6 para utilizar esta funcionalidade';
  SNotSupported = 'Funcionalidade não suportada';
  SNotPermitted = 'Não Permitido';
  SFileAccessError = 'Erro ao acessar o arquivo temporário';
  SConnectionTimeout = 'Tempo de limite de conexão com o Banco de Dados foi excedido';
  SCannotSetDatabase = 'Não foi possível selecionar o Banco de Dados';
  SCannotSetTransaction = 'Não foi possível selecionar a transação';
  SOperationCancelled = 'Operação cancelada pelo usuário';
  SDPBConstantNotSupported = 'Constante DPB (isc_dpb_%s) não é suportada';
  SDPBConstantUnknown = 'Constante DPB (%d) é desconhecida';
  STPBConstantNotSupported = 'Constante TPB (isc_tpb_%s) não é suportada';
  STPBConstantUnknown = 'Constante TPB (%d) é desconhecida';
  SDatabaseClosed = 'Não foi possível realizar a operação -- DB está fechado';
  SDatabaseOpen = 'Não foi possível realizar a operação -- DB está aberto';
  SDatabaseNameMissing = 'DatabaseName não preenchido';
  SNotInTransaction = 'Transação inativa';
  SInTransaction = 'Transação ativa';
  STimeoutNegative = 'Timeout não pode ser negativo';
  SNoDatabasesInTransaction = 'Nenhum IBDatabase está apontando para o componente Transaction';
  SUpdateWrongDB = 'Updating wrong database';
  SUpdateWrongTR = 'Updating wrong transaction. Unique transaction expected in set';
  SDatabaseNotAssigned = 'Database não atribuído';
  STransactionNotAssigned = 'Transaction não atribuída';
  SXSQLDAIndexOutOfRange = 'XSQLDA índice fora de faixa';
  SXSQLDANameDoesNotExist = 'XSQLDA nome não existe (%s)';
  SEOF = 'Fim de Arquivo';
  SBOF = 'Inicio de Arquivo';
  SInvalidStatementHandle = 'Handle de comando inválido';
  SSQLOpen = 'IBSQL Open';
  SSQLClosed = 'IBSQL Closed';
  SDatasetOpen = 'Dataset open';
  SDatasetClosed = 'Dataset closed';
  SUnknownSQLDataType = 'Tipo de Dado SQL desconhecido (%d)';
  SInvalidColumnIndex = 'Índice de coluna inválido (índice excede a faixa permitida)';
  SInvalidParamColumnIndex = 'Índice de parametro inválido (índice excede a faixa permitida)';
  SInvalidDataConversion = 'Conversão de dado inválida';
  SColumnIsNotNullable = 'A coluna não pode ser null (%s)';
  SBlobCannotBeRead = 'Não foi possível ler o campo Blob';
  SBlobCannotBeWritten = 'Não foi possível escrever no campo Blob';
  SEmptyQuery = 'Consulta vazia';
  SCannotOpenNonSQLSelect = 'Não é possível "abrir" um comando não select. Use ExecQuery';
  SNoFieldAccess = 'No access to field "%s"';
  SFieldReadOnly = 'Campo "%s" é somente leitura';
  SFieldNotFound = 'Field "%s" not found';
  SNotEditing = 'Não está em modo de edição';
  SCannotInsert = 'Cannot insert into dataset. (No insert query)';
  SCannotPost = 'Cannot post. (No update/insert query)';
  SCannotUpdate = 'Cannot update. (No update query)';
  SCannotDelete = 'Cannot delete from dataset. (No delete query)';
  SCannotRefresh = 'Cannot refresh row. (No refresh query)';
  SBufferNotSet = 'Buffer not set';
  SCircularReference = 'Circular references not permitted';
  SSQLParseError = 'SQL Parse Error:' + CRLF + CRLF + '%s';
  SUserAbort = 'User abort';
  SDataSetUniDirectional = 'Data set is uni-directional';
  SCannotCreateSharedResource = 'Cannot create shared resource. (Windows error %d)';
  SWindowsAPIError = 'Windows API error. (Windows error %d [$%.8x])';
  SColumnListsDontMatch = 'Column lists do not match';
  SColumnTypesDontMatch = 'Column types don''t match. (From index: %d; To index: %d)';
  SCantEndSharedTransaction = 'Can''t end a shared transaction unless it is forced and equal ' +
                             'to the transaction''s TimeoutAction';
  SFieldUnsupportedType = 'Tipo de campo não suportado';
  SCircularDataLink = 'Circular DataLink Reference';
  SEmptySQLStatement = 'Comando SQL vazio';
  SIsASelectStatement = 'use Open for a Select Statement';
  SRequiredParamNotSet = 'Required Param value not set';
  SNoStoredProcName = 'No Stored Procedure Name assigned';
  SIsAExecuteProcedure = 'use ExecProc for Procedure; use TQuery for Select procedures';
  SUpdateFailed = 'Update Failed';
  SNotCachedUpdates = 'CachedUpdates not enabled';
  SNotLiveRequest = 'Request is not live - cannot modify';
  SNoProvider = 'No Provider';
  SNoRecordsAffected = 'No Records Affected';
  SNoTableName = 'No Table Name assigned';
  SCannotCreatePrimaryIndex = 'Cannot Create Primary Index; are created automatically';
  SCannotDropSystemIndex = 'Cannot Drop System Index';
  STableNameMismatch = 'Table Name Mismatch';
  SIndexFieldMissing = 'Index Field Missing';
  SInvalidCancellation = 'Cannot Cancel events while processing';
  SInvalidEvent = 'Invalid Event';
  SMaximumEvents = 'Exceded Maximum Event limits';
  SNoEventsRegistered = 'No Events Registered';
  SInvalidQueueing = 'Invalid Queueing';
  SInvalidRegistration = 'Invalid Registration';
  SInvalidBatchMove = 'Invalid Batch Move';
  SSQLDialectInvalid = 'SQL Dialect Invalid';
  SSPBConstantNotSupported = 'SPB Constant Not supported';
  SSPBConstantUnknown = 'SPB Constant Unknown';
  SServiceActive = 'Cannot perform operation -- service is not attached';
  SServiceInActive = 'Cannot perform operation -- service is attached';
  SServerNameMissing = 'Server Name Missing';
  SQueryParamsError = 'Query Parameters missing or incorrect';
  SStartParamsError = 'start Parameters missing or incorrect';
  SOutputParsingError = 'Unexpected Output buffer value';
  SUseSpecificProcedures = 'Generic ServiceStart not applicable: Use Specific Procedures to set configuration params';
  SSQLMonitorAlreadyPresent = 'SQL Monitor Instance is already present';
  SCantPrintValue = 'Cannot print value';
  SEOFReached = 'SEOFReached';
  SEOFInComment = 'EOF in comment detected';
  SEOFInString = 'EOF in string detected';
  SParamNameExpected = 'Parameter name expected';
  SSuccess = 'Successful execution';
  SDelphiException = 'DelphiException %s';
  SNoOptionsSet = 'No Install Options selected';
  SNoDestinationDirectory = 'DestinationDirectory is not set';
  SNosourceDirectory = 'SourceDirectory is not set';
  SNoUninstallFile = 'Uninstall File Name is not set';
  SOptionNeedsClient = '%s component requires Client to function properly';
  SOptionNeedsServer = '%s component requires Server to function properly';
  SInvalidOption = 'Invalid option specified';
  SInvalidOnErrorResult = 'Unexpected onError return value';
  SInvalidOnStatusResult = 'Unexpected onStatus return value';

  SInterbaseExpressVersion = 'InterbaseExpress 4.2';
  SEditSQL = 'Editar SQL';
  
implementation

end.
 