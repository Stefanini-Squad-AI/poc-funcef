{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraAgenteRisco;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbPpraAgenteRisco = class(TCmDbObject)
  private
    FIdagenterisco: TCmDbField;
    FIndtipo: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IndTipo: TCmDbField read FIndtipo write FIndtipo;
    property IdAgenteRisco: TCmDbField read FIdagenterisco write FIdagenterisco;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbPpraAgenteRisco }

constructor TDbPpraAgenteRisco.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRAAGENTERISCO';

  FIndtipo := CreateCmDbField('INDTIPO',ftFloat,false,false,false,true,'');
  FIdagenterisco := CreateCmDbField('IDAGENTERISCO',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
end;

function TDbPpraAgenteRisco.Insert: boolean;
begin
  FIdagenterisco.asFloat := GetSequence('PPRAAGENTERISCO');
  Result := inherited Insert;
end;

end.
