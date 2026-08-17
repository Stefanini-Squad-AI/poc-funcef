{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/03/2003                                 }
{                                                       }
{*******************************************************}

unit uDbTabGener;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbTabGener = class(TCmDbObject)
  private
    FCodTabela: TCmDbField;
    FDescricao: TCmDbField;
    FIdModulo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property CodTabela: TCmDbField read FCodTabela write FCodTabela;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property IdModulo: TCmDbField read FIdModulo write FIdModulo;
  end;

implementation

uses uCtrlFuncoesRH;

{ TDbTabGener }

constructor TDbTabGener.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TABGENER';

  FCodTabela := CreateCmDbField('CODTABELA',ftString,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
  FIdModulo := CreateCmDbField('IDMODULO',ftFloat,false,false,false,true,'');
end;

function TDbTabGener.Insert: boolean;
begin
  FIdModulo.asFloat := MODFOL;
  Result := inherited Insert;
end;

end.
