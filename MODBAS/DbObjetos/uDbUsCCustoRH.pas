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

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbUsCCustoRH = class(TCmDbObject)
  private
    FCodCentroCusto: TCmDbField;
    FIdUsuario: TCmDbField;
    FIdEmpresa: TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdUsuario: TCmDbField read FIdUsuario write FIdUsuario;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
  end;

implementation

{ TDbUsCCustoRH }

{$IFNDEF VERSAO0505}
constructor TDbUsCCustoRH.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbUsCCustoRH.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'USCCUSTORH';

  FIdUsuario := CreateCmDbField('IDUSUARIO',ftFloat,true,true,false,false,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,true,true,false,false,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,true,true,false,false,'');
end;

end.
