{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraAcoes;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbPpraAcoes = class(TCmDbObject)
  private
    FIdacoes: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdAcoes: TCmDbField read FIdacoes write FIdacoes;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbPpraAcoes }

constructor TDbPpraAcoes.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRAACOES';

  FIdacoes := CreateCmDbField('IDACOES',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
end;

function TDbPpraAcoes.Insert: boolean;
begin
  FIdacoes.asFloat := GetSequence('PPRAACOES');
  Result := inherited Insert;
end;

end.
