{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 04/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbCargo;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbCargo = class(TCmDbObject)
  private
    FIdCargo: TCmDbField;
    FTitulo: TCmDbField;
    FDescricao: TCmDbField;
    FCbo2002: TCmDbField;
    FIdFaixaSalarial: TCmDbField;
    FCodGrpTrein: TCmDbField;
    FCodGrpFunc: TCmDbField;
    FCodNivel: TCmDbField;
    FPontosHay: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property Titulo: TCmDbField read FTitulo write FTitulo;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property Cbo2002: TCmDbField read FCbo2002 write FCbo2002;
    property IdFaixaSalarial: TCmDbField read FIdFaixaSalarial write FIdFaixaSalarial;
    property CodGrpTrein: TCmDbField read FCodGrpTrein write FCodGrpTrein;
    property CodGrpFunc: TCmDbField read FCodGrpFunc write FCodGrpFunc;
    property CodNivel: TCmDbField read FCodNivel write FCodNivel;
    property PontosHay: TCmDbField read FPontosHay write FPontosHay;
  end;

implementation

{ TDbCargo }

constructor TDbCargo.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CARGO';

  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,true,true,false,true,'');
  FTitulo := CreateCmDbField('TITULO',ftString,true,false,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftBlob,false,false,false,true,'');
  FCbo2002 := CreateCmDbField('CBO2002',ftFloat,false,false,false,true,'');
  FIdFaixaSalarial := CreateCmDbField('IDFAIXASALARIAL',ftFloat,false,false,false,true,'');
  FCodGrpTrein := CreateCmDbField('CODGRPTREIN',ftString,false,false,false,true,'');
  FCodGrpFunc := CreateCmDbField('CODGRPFUNC',ftString,false,false,false,true,'');
  FCodNivel := CreateCmDbField('CODNIVEL',ftFloat,false,false,false,true,'');
  FPontosHay := CreateCmDbField('PONTOSHAY',ftFloat,false,false,false,false,'');
end;

end.
