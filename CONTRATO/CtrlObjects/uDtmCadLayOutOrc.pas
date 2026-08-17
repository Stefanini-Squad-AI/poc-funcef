{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
unit uDtmCadLayOutOrc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, uCmSqlParams;

type
  TDtmCadLayOutOrc = class(TDataModule)
    Qry: TCMSqlParams;
    qryRelatorio: TCMSqlParams;
    qryReports: TCMSqlParams;
    qryDemoColMes: TCMSqlParams;
    qryDemoNormal: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
