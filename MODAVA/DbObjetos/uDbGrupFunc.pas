{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 15/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupFunc;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbGrupFunc = class(TCmDbObject)
  private
    FCodGrpFunc: TCmDbField;
    FDescGrpFunc: TCmDbField;
    FIdGrInstr: TCmDbField;
    FIntervalo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodGrpFunc: TCmDbField read FCodGrpFunc write FCodGrpFunc;
    property DescGrpFunc: TCmDbField read FDescGrpFunc write FDescGrpFunc;
    property IdGrInstr: TCmDbField read FIdGrInstr write FIdGrInstr;
    property Intervalo: TCmDbField read FIntervalo write FIntervalo;
  end;

implementation

{ TDbGrupFunc }

constructor TDbGrupFunc.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'GrupFunc';

  FCodGrpFunc := CreateCmDbField('CodGrpFunc',ftString,true,true,false,false,'');
  FDescGrpFunc := CreateCmDbField('DescGrpFunc',ftString,true,false,false,false,'');
  FIdGrInstr := CreateCmDbField('IdGrInstr',ftFloat,false,false,false,true,'');
  FIntervalo := CreateCmDbField('Intervalo',ftFloat,false,false,false,false,'');
end;

end.
