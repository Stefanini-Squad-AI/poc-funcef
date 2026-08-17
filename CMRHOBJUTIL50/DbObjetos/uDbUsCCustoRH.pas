{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbUsCCustoRH;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbUsCCustoRH = class(TCmDbObject)
  private
    FCodCentroCusto: TCmDbField;
    FIdUsuario: TCmDbField;
    FIdEmpresa: TCmDbField;
    FFlgSupervisor: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdUsuario: TCmDbField read FIdUsuario write FIdUsuario;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
    property FlgSupervisor: TCmDbField read FFlgSupervisor write FFlgSupervisor;
  end;

implementation

{ TDbUsCCustoRH }

constructor TDbUsCCustoRH.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'USCCUSTORH';

  FIdUsuario := CreateCmDbField('IDUSUARIO',ftFloat,true,true,false,false,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,true,true,false,false,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,true,true,false,false,'');
  FFlgSupervisor := CreateCmDbField('FLGSUPERVISOR',ftFloat,false,false,false,false,'');
end;

end.
