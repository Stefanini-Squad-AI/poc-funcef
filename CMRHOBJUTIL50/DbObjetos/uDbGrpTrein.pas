{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbGrpTrein;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbGrpTrein = class(TCmDbObject)
  private
    FDescGrpTrein: TCmDbField;
    FCodGrpTrein: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodGrpTrein: TCmDbField read FCodGrpTrein write FCodGrpTrein;
    property DescGrpTrein: TCmDbField read FDescGrpTrein write FDescGrpTrein;
  end;

implementation

{ TDbGrpTrein }

constructor TDbGrpTrein.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'GRPTREIN';

  FCodGrpTrein := CreateCmDbField('CODGRPTREIN',ftString,true,true,false,false,'');
  FDescGrpTrein := CreateCmDbField('DESCGRPTREIN',ftString,true,false,false,false,'');
end;

end.
