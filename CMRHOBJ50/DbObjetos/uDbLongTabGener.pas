{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 01/04/2003                                 }
{                                                       }
{*******************************************************}

unit uDbLongTabGener;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbLongTabGener = class(TCmDbObject)
  private
    FIdTabela: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdTabela: TCmDbField read FIdTabela write FIdTabela;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbLongTabGener }

constructor TDbLongTabGener.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'LONGTABGENER';

  FIdTabela := CreateCmDbField('IDTABELA',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
end;

function TDbLongTabGener.Insert: boolean;
begin
  FIdTabela.asFloat := GetSequence('LONGTABGENER');
  Result := inherited Insert;
end;

end.
