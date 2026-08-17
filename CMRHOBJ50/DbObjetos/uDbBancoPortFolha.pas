{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 26/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbBancoPortFolha;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbBancoPortFolha = class(TCmDbObject)
  private
    FIdBanco: TCmDbField;
    FIdBancoPortForma: TCmDbField;
    FCodPortForma: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdBancoPortForma: TCmDbField read FIdBancoPortForma write FIdBancoPortForma;
    property IdBanco: TCmDbField read FIdBanco write FIdBanco;
    property CodPortForma: TCmDbField read FCodPortForma write FCodPortForma;
  end;

implementation

{ TDbBancoPortFolha }

constructor TDbBancoPortFolha.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'BANCOPORTFOLHA';

  FIdBancoPortForma := CreateCmDbField('IDBANCOPORTFORMA',ftFloat,true,true,false,true,'');
  FIdBanco := CreateCmDbField('IDBANCO',ftFloat,false,false,false,true,'');
  FCodPortForma := CreateCmDbField('CODPORTFORMA',ftFloat,true,false,false,true,'');
end;

function TDbBancoPortFolha.Insert: boolean;
begin
  FIdBancoPortForma.asFloat := GetSequence('BANCOPORTFOLHA');
  Result := inherited Insert;
end;

end.
