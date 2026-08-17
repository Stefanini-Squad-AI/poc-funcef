{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipoDocOficial;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTipoDocOficial = class(TCmDbObject)
  private
    FIdDocumento: TCmDbField;
    FCodDocumento: TCmDbField;
    FSiglaDocumento: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodDocumento: TCmDbField read FCodDocumento write FCodDocumento;
    property IdDocumento: TCmDbField read FIdDocumento write FIdDocumento;
    property SiglaDocumento: TCmDbField read FSiglaDocumento write FSiglaDocumento;
  end;

implementation

{ TDbTipoDocOficial }

constructor TDbTipoDocOficial.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TIPODOCOFICIAL';

  FCodDocumento := CreateCmDbField('CODDOCUMENTO',ftString,true,true,false,false,'');
  FIdDocumento := CreateCmDbField('IDDOCUMENTO',ftFloat,false,false,false,true,'');
  FSiglaDocumento := CreateCmDbField('SIGLADOCUMENTO',ftString,true,false,false,false,'');
end;

end.
