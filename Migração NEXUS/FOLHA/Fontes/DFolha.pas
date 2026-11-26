{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************
--------------------------------------------------------------------------------
//Pendência   : SIG97305
//Data        : 06/02/2020
//Responsável : Andre Imakawa
//Alteração   : Add campo CODPROVDESC no objeto qryProventoPrevia.
//------------------------------------------------------------------------------
// Rotina      : -
// Autor(a)    : Felipe A. Santos
// Alteração Form : Alteração somente no Dfm, qryProventoPrevia
// Data        : 06/05/2014
// Pendência   : SOL 230845 PPM 366721
// Descricao   : Alteração somente no Dfm, qryProventoPrevia
--------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 29/06/2009
// Pendência   : SOL 121343 Kintana 583172
// Descricao   : Foi retirado a condição FLGDESATIVADO=O do MontaSelect.
}
unit DFolha;

interface

uses Forms, Wwquery, DBTables, Db, Classes, MontaSelect;

type
  TdtmFolha = class(TDataModule)
    qryIntegraRubXPlano: TwwQuery;
    qryIntegraPlano: TwwQuery;
    qryCodProvDesc: TwwQuery;
    qryAux: TwwQuery;
    qryReserva: TwwQuery;
    qryUpdReserva: TwwQuery;
    qryRubIndiv: TwwQuery;
    qryUpdRubIndiv1: TwwQuery;
    qryABNPart: TwwQuery;
    qryABNPlanoPatro: TwwQuery;
    qryABNPlano: TwwQuery;
    qryRubIndiv2: TwwQuery;
    qryInsTmpDesc: TwwQuery;
    qryInsIRRF: TwwQuery;
    qryDescFolha1: TwwQuery;
    InsTmpDesc: TUpdateSQL;
    qryInsRubSal: TwwQuery;
    qryCotMoedaData: TwwQuery;
    qryNumBenef: TwwQuery;
    qryInsPrevia: TwwQuery;
    qryUpdDescFolha: TwwQuery;
    qryDesfazSalVirt: TwwQuery;
    qryParaCobDef: TwwQuery;
    qryUpdReassocia: TwwQuery;
    qryFlgCobra: TwwQuery;
    qryUpdPartPrevPlan: TwwQuery;
    qryUltEvento: TwwQuery;
    qryUpdElegpatro: TwwQuery;
    qryHst: TwwQuery;
    qryProvFolha: TwwQuery;
    qryUpdRubIndiv: TwwQuery;
    qryFiltraDescFolha: TwwQuery;
    qryRubXPlano: TwwQuery;
    qryProventoFolha: TwwQuery;
    qryProventoPrevia: TwwQuery;
    qryBeneficio: TwwQuery;
    qryParametrosFolha: TwwQuery;
    MSBenef: TMontaSelect;
    qryModalidade: TwwQuery;
    qryModalidadeIDBENEFICIO: TFloatField;
    qryModalidadeTPMODALIDADE: TStringField;
    qryTipoOpcaoIR: TwwQuery;
    qryTipoOpcaoIRTIPOOPCAOIR: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmFolha: TdtmFolha;


implementation

{$R *.DFM}

end.
{------------------------------------------------------------------------------|
| UNIT: DFOLHA                                                                 |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE COM QUERYS UTILIZADAS PELOS PROCESSOS DE PREPARO, PREVIA E     |
| EFETIVAÇÃO.                                                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27.09.2001 A 27.09.2001                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERAÇÃO NA QUERY qryUltEvento PARA RETIRAR PARAMETRO IDBENEFICIO         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERAÇÃO NA QUERY QRYINSRUBSAL PARA TRATAR GRAVACAO DO SALARIO VIRTUAL    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/02/2002 A 23/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12c                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA QUERY QRYULTEVENTO.                                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/07/2002 A 23/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |                                                                              |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/08/2002 A 09/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DE QUERYS QUE UTILIZAVAM NUMPRIORIDADE PARA NUMPRIORIDADEFB DA   |
| PROVDESC.                                                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/08/2003 A 12/08/2003                         |
| PENDÊNCIA: 13995                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01b                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA USAR OBJETO DE IRRF CUSTOMIZADO PARA TABELA DE IR HISTÓRICA.  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/09/2004 A 14/09/2004                         |
| PENDÊNCIA: 17674                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13g                                              |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NO MONTA SELECT GERAL PARA INCLUIR A COLUNA INSCRIÇÃO.           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/12/2004 A 09/12/2004                         |
| PENDÊNCIA: 18237                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.15D                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - OBTER FLGRUBLEGAL DA PROVDESC NA QRYPROVENTO.                              |
|                                                                              |
|------------------------------------------------------------------------------}

