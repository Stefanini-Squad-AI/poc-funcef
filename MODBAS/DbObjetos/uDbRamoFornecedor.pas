{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 08/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbRamoFornecedor;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbRamoFornecedor = class(TCmDbObject)
  private
    FIdRamoFornecedor: TCmDbField;
    FDescRamoFornecedor: TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdRamoFornecedor: TCmDbField read FIdRamoFornecedor write FIdRamoFornecedor;
    property DescRamoFornecedor: TCmDbField read FDescRamoFornecedor write FDescRamoFornecedor;
  end;

implementation

{ TDbRamoFornecedor }

{$IFNDEF VERSAO0505}
constructor TDbRamoFornecedor.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbRamoFornecedor.Create; 
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'RamoFornecedor';

  FIdRamoFornecedor := CreateCmDbField('IdRamoFornecedor',ftFloat,true,true,false,false,'');
  FDescRamoFornecedor := CreateCmDbField('DescRamoFornecedor',ftString,true,false,false,false,'');
end;

end.
