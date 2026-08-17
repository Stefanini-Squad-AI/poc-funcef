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
    qryPlanoPuro: TwwQuery;
    dsPlanoPuro: TwwDataSource;
    qryContrib: TwwQuery;
    qryCCusto1: TwwQuery;
    qryAtividade: TwwQuery;
    dsAtividade: TwwDataSource;
    qryformapag: TwwQuery;
    dsformapag: TwwDataSource;
    qryCCusto: TwwQuery;
    dsTipoDocCAR: TwwDataSource;
    qryTipoDocCAR: TwwQuery;
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
    qryUSistema: TwwQuery;
    qryDecTercPatro: TwwQuery;
    qryDecTercPlano: TwwQuery;
    qryPatroDados: TwwQuery;
    qryPlanoPrev: TwwQuery;
    qryContribSitPart: TwwQuery;
    qryContribPart: TwwQuery;
    qryPrograma: TwwQuery;
    qryEmpresaProp: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmIntegraCAPCAR: TdtmIntegraCAPCAR;

implementation

// FERNANDO - P. 15467 - INICIO - 22/12/03
// ALTEREI O sql DA QUERY qrycentrespon
// ALTEREI O sql DA QUERY qryccusto
// FERNANDO - P. 15467 - FIM - 22/12/03

{$R *.DFM}

end.
