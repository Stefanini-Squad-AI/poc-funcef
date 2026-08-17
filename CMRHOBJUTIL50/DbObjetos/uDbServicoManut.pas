{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio                         }
{ Atualizado Em: 16/04/2003                             }
{                                                       }
{*******************************************************}

unit uDbServicoManut;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbServicoManut = class(TCmDbObject)
  private
    FIdServicoManut: TCmDbField;
    FDescServico: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdServicoManut: TCmDbField read FIdServicoManut write FIdServicoManut;
    property DescServico: TCmDbField read FDescServico write FDescServico;
  end;

implementation

{ TDbServicoManut }

constructor TDbServicoManut.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'SERVICOMANUT';

  FIdServicoManut := CreateCmDbField('IDSERVICOMANUT',ftFloat,true,true,false,true,'');
  FDescServico := CreateCmDbField('DESCSERVICO',ftString,false,false,false,true,'');
end;

function TDbServicoManut.Insert: boolean;
begin
  FIdServicoManut.asFloat := GetSequence('SERVICOMANUT');
  Result := inherited Insert;
end;

end.
