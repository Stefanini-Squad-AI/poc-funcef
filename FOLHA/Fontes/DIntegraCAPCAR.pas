{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit DIntegraCAPCAR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwquery;

type
  TdtmIntegraCAPCAR = class(TDataModule)
    qryPatro: TwwQuery;
    dsPatro: TwwDataSource;
    qryPlano: TwwQuery;
    dsPlano: TwwDataSource;
    qryContribPlano: TwwQuery;
    qryBenef: TwwQuery;
    qryPlanoPuro: TwwQuery;
    dsPlanoPuro: TwwDataSource;
    qryContrib: TwwQuery;
    qryBenefPlano: TwwQuery;
    qryReservaPlano: TwwQuery;
    qryCCusto1: TwwQuery;
    qryAtividade: TwwQuery;
    dsAtividade: TwwDataSource;
    qryformapag: TwwQuery;
    dsformapag: TwwDataSource;
    qryCCusto: TwwQuery;
    dsTipoDocCAR: TwwDataSource;
    qryTipoDocCAR: TwwQuery;
    qryContribPart: TwwQuery;
    qryReservaPart: TwwQuery;
    qryParticipante: TwwQuery;
    dsParticipante: TwwDataSource;
    qrycentrespon: TwwQuery;
    qrytipooper: TwwQuery;
    qrySubConta: TwwQuery;
    qryAlterador: TwwQuery;
    dsTipoDocCAP: TwwDataSource;
    qryTipoDocCAP: TwwQuery;
    qryAltPagar: TwwQuery;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    qryBfciario: TwwQuery;
    qryBenefPart: TwwQuery;
    qryBenefAbono: TwwQuery;
    qryBenefPlanoAbono: TwwQuery;
    qryBenefPartAbono: TwwQuery;
    qryUSistema: TwwQuery;
    qryDecTercPatro: TwwQuery;
    qryDecTercPlano: TwwQuery;
    qryDecTercPart: TwwQuery;
    qryPatroDados: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmIntegraCAPCAR: TdtmIntegraCAPCAR;

implementation

{$R *.DFM}

end.
{==============================================================================|
| UNIT: DINTEGRACAPCAR                                                         |
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

