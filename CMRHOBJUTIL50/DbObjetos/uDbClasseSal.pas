{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbClasseSal;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbClasseSal = class(TCmDbObject)
  private
    FIdFaixaSalarial: TCmDbField;
    FCodGrpFunc: TCmDbField;
    FMinimo: TCmDbField;
    FMaximo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); Override;

    property IdFaixaSalarial: TCmDbField read FIdFaixaSalarial write FIdFaixaSalarial;
    property CodGrpFunc: TCmDbField read FCodGrpFunc write FCodGrpFunc;
    property Minimo: TCmDbField read FMinimo write FMinimo;
    property Maximo: TCmDbField read FMaximo write FMaximo;
  end;

implementation

{ TDbClasseSal }

constructor TDbClasseSal.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ClasseSal';

  FIdFaixaSalarial := CreateCmDbField('IdFaixaSalarial',ftFloat,true,true,false,true,'');
  FCodGrpFunc := CreateCmDbField('CodGrpFunc',ftString,true,true,false,true,'');
  FMinimo := CreateCmDbField('Minimo',ftFloat,false,false,false,false,'');
  FMaximo := CreateCmDbField('Maximo',ftFloat,false,false,false,false,'');
end;

end.
