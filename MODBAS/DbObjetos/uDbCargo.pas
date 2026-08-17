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

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbCargo = class(TCmDbObject)
  private
    FIdCargo: TCmDbField;
    FTitulo: TCmDbField;
    FDescricao: TCmDbField;
    FCbo: TCmDbField;
    FIdFaixaSalarial: TCmDbField;
    FCodGrpTrein: TCmDbField;
    FCodGrpFunc: TCmDbField;
    FCodNivel: TCmDbField;    
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property Titulo: TCmDbField read FTitulo write FTitulo;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property Cbo: TCmDbField read FCbo write FCbo;
    property IdFaixaSalarial: TCmDbField read FIdFaixaSalarial write FIdFaixaSalarial;
    property CodGrpTrein: TCmDbField read FCodGrpTrein write FCodGrpTrein;
    property CodGrpFunc: TCmDbField read FCodGrpFunc write FCodGrpFunc;
    property CodNivel: TCmDbField read FCodNivel write FCodNivel;
  end;

implementation

{ TDbCargo }

{$IFNDEF VERSAO0505}
constructor TDbCargo.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbCargo.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CARGO';

  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,true,true,false,true,'');
  FTitulo := CreateCmDbField('TITULO',ftString,true,false,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftBlob,false,false,false,true,'');
  FCbo := CreateCmDbField('CBO',ftFloat,false,false,false,true,'');
  FIdFaixaSalarial := CreateCmDbField('IDFAIXASALARIAL',ftFloat,false,false,false,true,'');
  FCodGrpTrein := CreateCmDbField('CODGRPTREIN',ftString,false,false,false,true,'');
  FCodGrpFunc := CreateCmDbField('CODGRPFUNC',ftString,false,false,false,true,'');
  FCodNivel := CreateCmDbField('CODNIVEL',ftFloat,false,false,false,true,'');
end;

end.
