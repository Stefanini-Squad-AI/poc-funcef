// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Pendência   : SOL 163982/7003 - KTN 1489901
//Responsável : Vinicius Eduardo Nascimento Maciel
//Data        : 22/11/2011
//Descrição   : Foi alterada a qryAtividade para que retorne apenas as atividades
//              ativas e analiticas.
//------------------------------------------------------------------------------
{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit DIntegracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwquery;

type
  TdtmIntegracao = class(TDataModule)
    dsTpReceb: TwwDataSource;
    qryTpReceb: TwwQuery;
    qryTpRecebCODTIPRECDES: TStringField;
    qryTpRecebDESCRICAO: TStringField;
    qryTpRecebANASINT: TStringField;
    dsContaContabil1: TwwDataSource;
    qryContaContabil1: TwwQuery;
    qryContaContabil1PLACONTA: TStringField;
    qryContaContabil1PLANOME: TStringField;
    qryContaContabil1PLATIPO: TStringField;
    qryAtividade: TwwQuery;
    dsAtividade: TwwDataSource;
    qryformapag: TwwQuery;
    dsformapag: TwwDataSource;
    qryCCusto: TwwQuery;
    dsTipoDocCAR: TwwDataSource;
    qryTipoDocCAR: TwwQuery;
    qrycentrespon: TwwQuery;
    dsContaContabil: TwwDataSource;
    qryContaContabil: TwwQuery;
    qryContaContabilPLACONTA: TStringField;
    qryContaContabilPLANOME: TStringField;
    qryContaContabilPLATIPO: TStringField;
    qrytipooper: TwwQuery;
    qrySubConta: TwwQuery;                   
    qryUSistema: TwwQuery;
    qryTpRecebRECPAG: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmIntegracao: TdtmIntegracao;

implementation

{$R *.DFM}

end.
{==============================================================================|
| UNIT: DINTEGRACAO                                                            |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE PARA CONSULTAS RELACIONADAS A INTEGRAÇÃO COM O FINANCEIRO.     |
|                                                                              |
|==============================================================================|
|                                                                              |
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

