{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
unit uDMCopiaContaOrcamen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, Db, DBTables, Wwquery, DBClient, uCMClientDataSet;

type
  TdtmCopiaContaOrcamen = class(TDataModule)
    qryCCustoOri: TCMSqlParams;
    qryContasOri: TCMSqlParams;
    qryBuscaContaDes: TCMSqlParams;
    qryCCustoDes: TCMSqlParams;
    qryCRespOri: TCMSqlParams;
    qrySaldo: TCMSqlParams;
    qryCRespDes: TCMSqlParams;
    qryAtivProjDes: TCMSqlParams;
    qryPatroDes: TCMSqlParams;
    qryPlanoPrevDes: TCMSqlParams;
    qryPlanoPrevOri: TCMSqlParams;
    qryPatroOri: TCMSqlParams;
    qryCompOri: TCMSqlParams;
    qryInsContasDes: TCMSqlParams;
    qryAtivProjOri: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.DFM}

end.

