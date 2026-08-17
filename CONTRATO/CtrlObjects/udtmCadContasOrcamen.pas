{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit udtmCadContasOrcamen;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Parser10, Mask;

Type
  TdtmCadContasOrcamen = class(TDataModule)
    qryAuxContab: TCMSqlParams;
    QryDataView: TCMSqlParams;
    QryDet: TCMSqlParams;
    qryDetContaOrc: TCMSqlParams;
    qryDetContaRea: TCMSqlParams;
    qryDetCond: TCMSqlParams;
    qryDetFluxo: TCMSqlParams;
    qryGrupo: TCMSqlParams;
    qryCenRespConta: TCMSqlParams;
    qryContasOrc: TCMSqlParams;
    qryContaCondIni: TCMSqlParams;
    qryContaCondFim: TCMSqlParams;
    qryContaCondRes: TCMSqlParams;
    qryTipoRD: TCMSqlParams;
    qryUnidNegoc: TCMSqlParams;
    qryUnidNegocConta: TCMSqlParams;
    qryCentroRespon: TCMSqlParams;
    qryCCusto: TCMSqlParams;
    qryCCustoConta: TCMSqlParams;
    qryCCustoFluxo: TCMSqlParams;
    qryGrupoAux: TCMSqlParams;
    qryAux: TCMSqlParams;
    Parser: TParser;
    QryTestaComposicao: TCMSqlParams;
    qryPlanoPrev: TCMSqlParams;
    qryPlanoPrevConta: TCMSqlParams;
    qryPatro: TCMSqlParams;
    qryTodoDet: TCMSqlParams;
    qryPlanoContabil: TCMSqlParams;
    qryContasRef: TCMSqlParams;
    qryPatroConta: TCMSqlParams;
    qryMovOrcamento: TCMSqlParams;
    qryContaContab: TCMSqlParams;
    qryContaContabil: TCMSqlParams;
    Qry: TCMSqlParams;
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Implementation

{$R *.DFM}

End.
