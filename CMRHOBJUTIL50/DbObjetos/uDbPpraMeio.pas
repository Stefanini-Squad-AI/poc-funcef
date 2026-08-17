{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraMeio;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbPpraMeio = class(TCmDbObject)
  private
    FIdpprameio: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdPpraMeio: TCmDbField read FIdpprameio write FIdpprameio;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbPpraMeio }

constructor TDbPpraMeio.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRAMEIO';

  FIdpprameio := CreateCmDbField('IDPPRAMEIO',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
end;

function TDbPpraMeio.Insert: boolean;
begin
  FIdpprameio.asFloat := GetSequence('PPRAMEIO');
  Result := inherited Insert;
end;

end.
