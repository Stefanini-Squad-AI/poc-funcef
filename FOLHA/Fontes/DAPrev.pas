{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit DAPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, URegra;

type
  TdtmAPrev = class(TDataModule)
    qryRegra: TwwQuery;
    qryGrava: TwwQuery;
    qryContPlanPatro: TwwQuery;
    qryContPrev: TwwQuery;
    qry: TwwQuery;
    qryVerificaObrig: TwwQuery;
    qryAux: TwwQuery;
    regraAPrev: TRegra;
    qryAux2: TwwQuery;
    qryAuxContrib: TwwQuery;
    qryRubricaxPess: TwwQuery;
    qryAlteradorContrib: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmAPrev: TdtmAPrev;

implementation

{$R *.DFM}

end.

{==============================================================================|
| UNIT: DAPREV                                                                 |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE ORIGINARIO DO ADMPREV PARA SUPORTAR DATASET PARA ROTINAS DE    |
| CONTRIBUIÇÃO.                                                                |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERAÇÃO NA QUERY QRYCONTPLANPATRO PARA OBTER COLUNA CODTIPDESEMBDEVOL    |
| QUE NÃO ESTAVA SENDO PARAMETRIZADA CORRETAMENTE NO ENVIO DE CONTRIBUIÇÃO     |
| PARA A TMPDESC.                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/09/2004 A 28/09/2004                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - O PARÂMETRO EXIBEMENSAGENS DO OBJETO REGRA FOI COLOCADO IGUAL A FALSE, DE  |
| FORMA A NÃO EXIBIR AS MENSAGENS AUTOMÁTICAS DO REGRA NOS PROCESSOS BATCH.    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------}
