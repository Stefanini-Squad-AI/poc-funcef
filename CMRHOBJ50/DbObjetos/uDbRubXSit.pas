{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/07/2002                                 }
{                                                       }
{*******************************************************}

unit uDbRubXSit;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbRubXSit = class(TCmDbObject)
  private
    FIdSitFunc: TCmDbField;
    FIdProvento: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdSitFunc: TCmDbField read FIdSitFunc write FIdSitFunc;
    property IdProvento: TCmDbField read FIdProvento write FIdProvento;
  end;

implementation

{ TDbRubXSit }

constructor TDbRubXSit.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'RUBXSIT';

  FIdSitFunc := CreateCmDbField('IDSITFUNC',ftFloat,true,true,false,false,'');
  FIdProvento := CreateCmDbField('IDPROVENTO',ftFloat,true,true,false,false,'');
end;

end.
