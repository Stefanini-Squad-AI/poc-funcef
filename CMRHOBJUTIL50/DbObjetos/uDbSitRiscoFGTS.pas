{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbSitRiscoFGTS;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbSitRiscoFGTS = class(TCmDbObject)
  private
    FIdSitRisco: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdSitRisco: TCmDbField read FIdSitRisco write FIdSitRisco;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbSitRiscoFGTS }

constructor TDbSitRiscoFGTS.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'SITRISCOFGTS';

  FIdSitRisco := CreateCmDbField('IDSITRISCO',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
end;

end.
