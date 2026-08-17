{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 08/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrInstr;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbGrInstr = class(TCmDbObject)
  private
    FIdGrInstr: TCmDbField;
    FDescricao: TCmDbField;
    FCodRAIS: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdGrInstr: TCmDbField read FIdGrInstr write FIdGrInstr;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property CodRAIS: TCmDbField read FCodRAIS write FCodRAIS;
  end;

implementation

{ TDbGrInstr }

constructor TDbGrInstr.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'GRINSTR';

  FIdGrInstr := CreateCmDbField('IDGRINSTR',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FCodRAIS := CreateCmDbField('CODRAIS',ftString,false,false,false,false,'');
end;

end.
