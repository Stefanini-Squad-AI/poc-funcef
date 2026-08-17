{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbFormaRescFGTS;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbFormaRescFGTS = class(TCmDbObject)
  private
    FCodDeposito: TCmDbField;
    FIdFormaResc: TCmDbField;
    FDescricao: TCmDbField;
    FFlgOptante: TCmDbField;
    FCodOficial: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdFormaResc: TCmDbField read FIdFormaResc write FIdFormaResc;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property FlgOptante: TCmDbField read FFlgOptante write FFlgOptante;
    property CodDeposito: TCmDbField read FCodDeposito write FCodDeposito;
    property CodOficial: TCmDbField read FCodOficial write FCodOficial;
  end;

implementation

{ TDbFormaRescFGTS }

constructor TDbFormaRescFGTS.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FORMARESCFGTS';

  FIdFormaResc := CreateCmDbField('IDFORMARESC',ftFloat,true,true,false,false,'');
  FFlgOptante := CreateCmDbField('FLGOPTANTE',ftFloat,false,false,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FCodDeposito := CreateCmDbField('CODDEPOSITO',ftString,false,false,false,false,'');
  FCodOficial := CreateCmDbField('CODOFICIAL',ftString,false,false,false,false,'');
end;

end.
