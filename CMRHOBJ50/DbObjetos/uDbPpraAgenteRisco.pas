{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 229873/16664
Nº PPM......: 570033
Data........: 11/12/2014
Responsável.: Felipe A. Santos
Descrição...: criação do campo CodigoeSocial.
-------------------------------------------------------------------------------------------------- }

unit uDbPpraAgenteRisco;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbPpraAgenteRisco = class(TCmDbObject)
  private
    FIdagenterisco: TCmDbField;
    FIndtipo: TCmDbField;
    FDescricao: TCmDbField;
    FCodigoeSocial: TCmDbField;  // Felipe A. Santos SOL229873/16664 PPM 570033

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IndTipo: TCmDbField read FIndtipo write FIndtipo;
    property IdAgenteRisco: TCmDbField read FIdagenterisco write FIdagenterisco;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property CodigoeSocial: TCmDbField read FCodigoeSocial write FCodigoeSocial; // Felipe A. Santos SOL229873/16664 PPM 570033
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
  FCodigoeSocial := CreateCmDbField('CODIGOESOCIAL',ftString,false,false,false,false,''); // Felipe A. Santos SOL229873/16664 PPM 570033
end;

function TDbPpraAgenteRisco.Insert: boolean;
begin
  FIdagenterisco.asFloat := GetSequence('PPRAAGENTERISCO');
  Result := inherited Insert;
end;

end.
