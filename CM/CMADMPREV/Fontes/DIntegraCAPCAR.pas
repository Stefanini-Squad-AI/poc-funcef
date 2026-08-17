// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 163982/7081
Nº KINTANA..: 1499847
Data........: 29/11/2011
Responsável.: Monica da Silva Gonzaga
Descrição...: Filtrados os "selects" na combo Atividade/projeto(qryAtividade),
para considerar apenas as ativas e analiticas.
-----------------------------------------------------------------------------------------------------}

//  Autor      : Augusto
//  Data       : 02/03/2005
//  Pendencia  : 15463
//  Descrição  : Parametros novos nas querys
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : qryPlanPrevContab
//  Data       : 20.10.2004
//  Pendencia  : 17578
//  Descrição  : Filtrar planos ativos
//------------------------------------------------------------------------------
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
    dsc: TDataSource;
    qryPlanPrevContab: TwwQuery;
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
