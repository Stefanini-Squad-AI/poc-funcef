{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 21/02/2002                             }
{                                                       }
{*******************************************************}

unit uDBTipoArea;

interface

uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

type
  TDBTipoArea = class(TCmDbObject)
  private
    FDesctipoarea: TCmDbField;
    FIdtipoarea: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdTipoArea: TCmDbField read FIdtipoarea write FIdtipoarea;
    property DescTipoArea: TCmDbField read FDesctipoarea write FDesctipoarea;
  end;

implementation

{ TDBTipoArea }

constructor TDBTipoArea.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TIPOAREA';

  FIdtipoarea := CreateCmDbField('IDTIPOAREA',ftFloat,true,true,false,true,'');
  FDesctipoarea := CreateCmDbField('DESCTIPOAREA',ftString,true,false,false,true,'');
end;

function TDBTipoArea.Insert: boolean;
begin
  FIdtipoarea.asFloat := GetSequence('TIPOAREA');
  Result := inherited Insert;
end;

end.
